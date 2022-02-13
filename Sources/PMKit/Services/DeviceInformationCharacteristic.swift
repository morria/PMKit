//
//  DeviceInformationCharacteristic.swift
//  Pods
//
//  Created by Jesse Curry on 10/24/15.
//  Edited by Paul Aschmann on 08/06/2020
//

import CoreBluetooth

public enum DeviceInformationCharacteristic:Characteristic {
    case SerialNumber
    case HardwareRevision
    case FirmwareRevision
    case ManufacturerName
    
    init?(uuid:CBUUID) {
        switch uuid {
        case DeviceInformationCharacteristic.SerialNumber.UUID:
            self = .SerialNumber
        case DeviceInformationCharacteristic.HardwareRevision.UUID:
            self = .HardwareRevision
        case DeviceInformationCharacteristic.FirmwareRevision.UUID:
            self = .FirmwareRevision
        case DeviceInformationCharacteristic.ManufacturerName.UUID:
            self = .ManufacturerName
        default:
            return nil
        }
    }
    
    var UUID:CBUUID {
        switch self {
        case .SerialNumber:
            return CBUUID(string: "CE060012-43E5-11E4-916C-0800200C9A66")
        case .HardwareRevision:
            return CBUUID(string: "CE060013-43E5-11E4-916C-0800200C9A66")
        case .FirmwareRevision:
            return CBUUID(string: "CE060014-43E5-11E4-916C-0800200C9A66")
        case .ManufacturerName:
            return CBUUID(string: "CE060015-43E5-11E4-916C-0800200C9A66")
        }
    }
    
    func parse(data:NSData?) -> CharacteristicModel? {
        switch self {
        case .SerialNumber:
            return nil
        case .HardwareRevision:
            return nil
        case .FirmwareRevision:
            return nil
        case .ManufacturerName:
            return nil
        }
    }
}
