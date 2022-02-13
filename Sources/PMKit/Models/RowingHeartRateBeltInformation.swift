//
//  RowingHeartRateBeltInformation.swift
//  Pods
//
//  Created by Jesse Curry on 10/27/15.
//  Edited by Paul Aschmann on 08/06/2020
//
import CoreData
struct RowingHeartRateBeltInformation: CharacteristicModel, CustomDebugStringConvertible {
    let DataLength = 6
    
    /*
     Manufacturer ID,
     Device Type,
     Belt ID Lo,
     Belt ID Mid Lo,
     Belt ID Mid Hi,
     Belt ID Hi
     */
    
    var manufacturerID:C2HeartRateBeltManufacturerID
    var deviceType:C2HeartRateBeltType
    var beltID:C2HeartRateBeltID
    
    init(fromData data: NSData) {
        var arr:[UInt8] = Array(repeating: 0, count: DataLength);
        data.getBytes(&arr, length: DataLength)
        
        manufacturerID = C2HeartRateBeltManufacturerID(arr[0])
        deviceType = C2HeartRateBeltType(arr[1])
        beltID = C2HeartRateBeltID(
            heartRateBeltIDWithLow: UInt32(arr[2]), midLow: UInt32(arr[3]),
            midHigh: UInt32(arr[4]), high: UInt32(arr[5]))
    }
    
    // MARK: PerformanceMonitor
    func updatePerformanceMonitor(performanceMonitor:PerformanceMonitor) {
        performanceMonitor.manufacturerID.value = manufacturerID
        performanceMonitor.deviceType.value = deviceType
        performanceMonitor.beltID.value = beltID
    }
    
    // MARK: -
    var debugDescription:String {
        return "[RowingHeartRateBeltInformation]"
    }
}

/*
 NSData extension to allow writing of this value
 */
extension NSData {
    convenience init(rowingHeartRateBeltInformation:RowingHeartRateBeltInformation) {
        let arr:[UInt8] = [
            UInt8(rowingHeartRateBeltInformation.manufacturerID),
            UInt8(rowingHeartRateBeltInformation.deviceType),
            UInt8(0xFF & (rowingHeartRateBeltInformation.manufacturerID)),
            UInt8(0xFF & (rowingHeartRateBeltInformation.manufacturerID >> 8)),
            UInt8(0xFF & (rowingHeartRateBeltInformation.manufacturerID >> 16)),
            UInt8(0xFF & (rowingHeartRateBeltInformation.manufacturerID >> 24))
        ];
        
        self.init(bytes: arr, length: arr.count * MemoryLayout<UInt8>.size)
    }
}
