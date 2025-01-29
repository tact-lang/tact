// struct with over 1023 bits so that it is serialized as multiple cells
struct SomeStruct {
    int: Int;
    bool: Bool;
    address: Address;
    a: Int;
    b: Int;
}

// ===============================
// Structs For Getters
// ===============================

struct GetAllMapsResult {
    // Integer Key Maps
    int_varint16: Int?;
    int_varint32: Int?;
    int_varuint16: Int?;
    int_varuint32: Int?;
    int_bool: Bool?;
    int_cell: Cell?;
    int_address: Address?;
    int_struct: SomeStruct?;

    int8_varint16: Int?;
    int8_varint32: Int?;
    int8_varuint16: Int?;
    int8_varuint32: Int?;
    int8_bool: Bool?;
    int8_cell: Cell?;
    int8_address: Address?;
    int8_struct: SomeStruct?;

    int42_varint16: Int?;
    int42_varint32: Int?;
    int42_varuint16: Int?;
    int42_varuint32: Int?;
    int42_bool: Bool?;
    int42_cell: Cell?;
    int42_address: Address?;
    int42_struct: SomeStruct?;

    int256_varint16: Int?;
    int256_varint32: Int?;
    int256_varuint16: Int?;
    int256_varuint32: Int?;
    int256_bool: Bool?;
    int256_cell: Cell?;
    int256_address: Address?;
    int256_struct: SomeStruct?;

    uint8_varint16: Int?;
    uint8_varint32: Int?;
    uint8_varuint16: Int?;
    uint8_varuint32: Int?;
    uint8_bool: Bool?;
    uint8_cell: Cell?;
    uint8_address: Address?;
    uint8_struct: SomeStruct?;

    uint42_varint16: Int?;
    uint42_varint32: Int?;
    uint42_varuint16: Int?;
    uint42_varuint32: Int?;
    uint42_bool: Bool?;
    uint42_cell: Cell?;
    uint42_address: Address?;
    uint42_struct: SomeStruct?;

    uint256_varint16: Int?;
    uint256_varint32: Int?;
    uint256_varuint16: Int?;
    uint256_varuint32: Int?;
    uint256_bool: Bool?;
    uint256_cell: Cell?;
    uint256_address: Address?;
    uint256_struct: SomeStruct?;

    // Address Key Maps
    address_varint16: Int?;
    address_varint32: Int?;
    address_varuint16: Int?;
    address_varuint32: Int?;
    address_bool: Bool?;
    address_cell: Cell?;
    address_address: Address?;
    address_struct: SomeStruct?;
}

struct ReplaceAllMapsResult {
    // Integer Key Maps
    int_varint16: Bool;
    int_varint32: Bool;
    int_varuint16: Bool;
    int_varuint32: Bool;
    int_bool: Bool;
    int_cell: Bool;
    int_address: Bool;
    int_struct: Bool;

    int8_varint16: Bool;
    int8_varint32: Bool;
    int8_varuint16: Bool;
    int8_varuint32: Bool;
    int8_bool: Bool;
    int8_cell: Bool;
    int8_address: Bool;
    int8_struct: Bool;

    int42_varint16: Bool;
    int42_varint32: Bool;
    int42_varuint16: Bool;
    int42_varuint32: Bool;
    int42_bool: Bool;
    int42_cell: Bool;
    int42_address: Bool;
    int42_struct: Bool;

    int256_varint16: Bool;
    int256_varint32: Bool;
    int256_varuint16: Bool;
    int256_varuint32: Bool;
    int256_bool: Bool;
    int256_cell: Bool;
    int256_address: Bool;
    int256_struct: Bool;

    uint8_varint16: Bool;
    uint8_varint32: Bool;
    uint8_varuint16: Bool;
    uint8_varuint32: Bool;
    uint8_bool: Bool;
    uint8_cell: Bool;
    uint8_address: Bool;
    uint8_struct: Bool;

    uint42_varint16: Bool;
    uint42_varint32: Bool;
    uint42_varuint16: Bool;
    uint42_varuint32: Bool;
    uint42_bool: Bool;
    uint42_cell: Bool;
    uint42_address: Bool;
    uint42_struct: Bool;

    uint256_varint16: Bool;
    uint256_varint32: Bool;
    uint256_varuint16: Bool;
    uint256_varuint32: Bool;
    uint256_bool: Bool;
    uint256_cell: Bool;
    uint256_address: Bool;
    uint256_struct: Bool;

    // Address Key Maps
    address_varint16: Bool;
    address_varint32: Bool;
    address_varuint16: Bool;
    address_varuint32: Bool;
    address_bool: Bool;
    address_cell: Bool;
    address_address: Bool;
    address_struct: Bool;
}

struct ReplaceGetAllMapsResult {
    // Integer Key Maps
    int_varint16: Int?;
    int_varint32: Int?;
    int_varuint16: Int?;
    int_varuint32: Int?;
    int_bool: Bool?;
    int_cell: Cell?;
    int_address: Address?;
    int_struct: SomeStruct?;

    int8_varint16: Int?;
    int8_varint32: Int?;
    int8_varuint16: Int?;
    int8_varuint32: Int?;
    int8_bool: Bool?;
    int8_cell: Cell?;
    int8_address: Address?;
    int8_struct: SomeStruct?;

    int42_varint16: Int?;
    int42_varint32: Int?;
    int42_varuint16: Int?;
    int42_varuint32: Int?;
    int42_bool: Bool?;
    int42_cell: Cell?;
    int42_address: Address?;
    int42_struct: SomeStruct?;

    int256_varint16: Int?;
    int256_varint32: Int?;
    int256_varuint16: Int?;
    int256_varuint32: Int?;
    int256_bool: Bool?;
    int256_cell: Cell?;
    int256_address: Address?;
    int256_struct: SomeStruct?;

    uint8_varint16: Int?;
    uint8_varint32: Int?;
    uint8_varuint16: Int?;
    uint8_varuint32: Int?;
    uint8_bool: Bool?;
    uint8_cell: Cell?;
    uint8_address: Address?;
    uint8_struct: SomeStruct?;

    uint42_varint16: Int?;
    uint42_varint32: Int?;
    uint42_varuint16: Int?;
    uint42_varuint32: Int?;
    uint42_bool: Bool?;
    uint42_cell: Cell?;
    uint42_address: Address?;
    uint42_struct: SomeStruct?;

    uint256_varint16: Int?;
    uint256_varint32: Int?;
    uint256_varuint16: Int?;
    uint256_varuint32: Int?;
    uint256_bool: Bool?;
    uint256_cell: Cell?;
    uint256_address: Address?;
    uint256_struct: SomeStruct?;

    // Address Key Maps
    address_varint16: Int?;
    address_varint32: Int?;
    address_varuint16: Int?;
    address_varuint32: Int?;
    address_bool: Bool?;
    address_cell: Cell?;
    address_address: Address?;
    address_struct: SomeStruct?;
}

struct ExistsAllMapsResult {
    // Integer Key Maps
    int_varint16: Bool;
    int_varint32: Bool;
    int_varuint16: Bool;
    int_varuint32: Bool;
    int_bool: Bool;
    int_cell: Bool;
    int_address: Bool;
    int_struct: Bool;

    int8_varint16: Bool;
    int8_varint32: Bool;
    int8_varuint16: Bool;
    int8_varuint32: Bool;
    int8_bool: Bool;
    int8_cell: Bool;
    int8_address: Bool;
    int8_struct: Bool;

    int42_varint16: Bool;
    int42_varint32: Bool;
    int42_varuint16: Bool;
    int42_varuint32: Bool;
    int42_bool: Bool;
    int42_cell: Bool;
    int42_address: Bool;
    int42_struct: Bool;

    int256_varint16: Bool;
    int256_varint32: Bool;
    int256_varuint16: Bool;
    int256_varuint32: Bool;
    int256_bool: Bool;
    int256_cell: Bool;
    int256_address: Bool;
    int256_struct: Bool;

    uint8_varint16: Bool;
    uint8_varint32: Bool;
    uint8_varuint16: Bool;
    uint8_varuint32: Bool;
    uint8_bool: Bool;
    uint8_cell: Bool;
    uint8_address: Bool;
    uint8_struct: Bool;

    uint42_varint16: Bool;
    uint42_varint32: Bool;
    uint42_varuint16: Bool;
    uint42_varuint32: Bool;
    uint42_bool: Bool;
    uint42_cell: Bool;
    uint42_address: Bool;
    uint42_struct: Bool;

    uint256_varint16: Bool;
    uint256_varint32: Bool;
    uint256_varuint16: Bool;
    uint256_varuint32: Bool;
    uint256_bool: Bool;
    uint256_cell: Bool;
    uint256_address: Bool;
    uint256_struct: Bool;

    // Address Key Maps
    address_varint16: Bool;
    address_varint32: Bool;
    address_varuint16: Bool;
    address_varuint32: Bool;
    address_bool: Bool;
    address_cell: Bool;
    address_address: Bool;
    address_struct: Bool;
}

struct IsEmptyAllMapsResult {
    // Integer Key Maps
    int_varint16: Bool;
    int_varint32: Bool;
    int_varuint16: Bool;
    int_varuint32: Bool;
    int_bool: Bool;
    int_cell: Bool;
    int_address: Bool;
    int_struct: Bool;

    int8_varint16: Bool;
    int8_varint32: Bool;
    int8_varuint16: Bool;
    int8_varuint32: Bool;
    int8_bool: Bool;
    int8_cell: Bool;
    int8_address: Bool;
    int8_struct: Bool;

    int42_varint16: Bool;
    int42_varint32: Bool;
    int42_varuint16: Bool;
    int42_varuint32: Bool;
    int42_bool: Bool;
    int42_cell: Bool;
    int42_address: Bool;
    int42_struct: Bool;

    int256_varint16: Bool;
    int256_varint32: Bool;
    int256_varuint16: Bool;
    int256_varuint32: Bool;
    int256_bool: Bool;
    int256_cell: Bool;
    int256_address: Bool;
    int256_struct: Bool;

    uint8_varint16: Bool;
    uint8_varint32: Bool;
    uint8_varuint16: Bool;
    uint8_varuint32: Bool;
    uint8_bool: Bool;
    uint8_cell: Bool;
    uint8_address: Bool;
    uint8_struct: Bool;

    uint42_varint16: Bool;
    uint42_varint32: Bool;
    uint42_varuint16: Bool;
    uint42_varuint32: Bool;
    uint42_bool: Bool;
    uint42_cell: Bool;
    uint42_address: Bool;
    uint42_struct: Bool;

    uint256_varint16: Bool;
    uint256_varint32: Bool;
    uint256_varuint16: Bool;
    uint256_varuint32: Bool;
    uint256_bool: Bool;
    uint256_cell: Bool;
    uint256_address: Bool;
    uint256_struct: Bool;

    // Address Key Maps
    address_varint16: Bool;
    address_varint32: Bool;
    address_varuint16: Bool;
    address_varuint32: Bool;
    address_bool: Bool;
    address_cell: Bool;
    address_address: Bool;
    address_struct: Bool;
}

struct AsCellAllMapsResult {
    // Integer Key Maps
    int_varint16: Cell?;
    int_varint32: Cell?;
    int_varuint16: Cell?;
    int_varuint32: Cell?;
    int_bool: Cell?;
    int_cell: Cell?;
    int_address: Cell?;
    int_struct: Cell?;

    int8_varint16: Cell?;
    int8_varint32: Cell?;
    int8_varuint16: Cell?;
    int8_varuint32: Cell?;
    int8_bool: Cell?;
    int8_cell: Cell?;
    int8_address: Cell?;
    int8_struct: Cell?;

    int42_varint16: Cell?;
    int42_varint32: Cell?;
    int42_varuint16: Cell?;
    int42_varuint32: Cell?;
    int42_bool: Cell?;
    int42_cell: Cell?;
    int42_address: Cell?;
    int42_struct: Cell?;

    int256_varint16: Cell?;
    int256_varint32: Cell?;
    int256_varuint16: Cell?;
    int256_varuint32: Cell?;
    int256_bool: Cell?;
    int256_cell: Cell?;
    int256_address: Cell?;
    int256_struct: Cell?;

    uint8_varint16: Cell?;
    uint8_varint32: Cell?;
    uint8_varuint16: Cell?;
    uint8_varuint32: Cell?;
    uint8_bool: Cell?;
    uint8_cell: Cell?;
    uint8_address: Cell?;
    uint8_struct: Cell?;

    uint42_varint16: Cell?;
    uint42_varint32: Cell?;
    uint42_varuint16: Cell?;
    uint42_varuint32: Cell?;
    uint42_bool: Cell?;
    uint42_cell: Cell?;
    uint42_address: Cell?;
    uint42_struct: Cell?;

    uint256_varint16: Cell?;
    uint256_varint32: Cell?;
    uint256_varuint16: Cell?;
    uint256_varuint32: Cell?;
    uint256_bool: Cell?;
    uint256_cell: Cell?;
    uint256_address: Cell?;
    uint256_struct: Cell?;

    // Address Key Maps
    address_varint16: Cell?;
    address_varint32: Cell?;
    address_varuint16: Cell?;
    address_varuint32: Cell?;
    address_bool: Cell?;
    address_cell: Cell?;
    address_address: Cell?;
    address_struct: Cell?;
}

// ===============================
// Messages For Operations
// ===============================

message SetAllMaps {
    // Key fields
    keyInt: Int;
    keyInt8: Int;
    keyInt42: Int;
    keyInt256: Int;
    keyUint8: Int;
    keyUint42: Int;
    keyUint256: Int;
    keyAddress: Address;

    // Value fields
    valueVarint16: Int?;
    valueVarint32: Int?;
    valueVaruint16: Int?;
    valueVaruint32: Int?;
    valueBool: Bool?;
    valueCell: Cell?;
    valueAddress: Address?;
    valueStruct: SomeStruct?;
}

message DelAllMaps {
    // Key fields
    keyInt: Int;
    keyInt8: Int;
    keyInt42: Int;
    keyInt256: Int;
    keyUint8: Int;
    keyUint42: Int;
    keyUint256: Int;
    keyAddress: Address;
}

message ReplaceAllMaps {
    // Key fields
    keyInt: Int;
    keyInt8: Int;
    keyInt42: Int;
    keyInt256: Int;
    keyUint8: Int;
    keyUint42: Int;
    keyUint256: Int;
    keyAddress: Address;

    // Value fields
    valueVarint16: Int?;
    valueVarint32: Int?;
    valueVaruint16: Int?;
    valueVaruint32: Int?;
    valueBool: Bool?;
    valueCell: Cell?;
    valueAddress: Address?;
    valueStruct: SomeStruct?;
}

message ReplaceGetAllMaps {
    // Key fields
    keyInt: Int;
    keyInt8: Int;
    keyInt42: Int;
    keyInt256: Int;
    keyUint8: Int;
    keyUint42: Int;
    keyUint256: Int;
    keyAddress: Address;

    // Value fields
    valueVarint16: Int?;
    valueVarint32: Int?;
    valueVaruint16: Int?;
    valueVaruint32: Int?;
    valueBool: Bool?;
    valueCell: Cell?;
    valueAddress: Address?;
    valueStruct: SomeStruct?;
}

message CheckNullReference {
    
}

// ===============================
// Test Contract
// ===============================

contract MapTestContract {
    receive() {}

    // ===============================
    // Integer (`Int`) Key Maps
    // ===============================

    int_varint16: map<Int, Int as varint16>;
    int_varint32: map<Int, Int as varint32>;
    int_varuint16: map<Int, Int as varuint16>;
    int_varuint32: map<Int, Int as varuint32>;
    int_bool: map<Int, Bool>;
    int_cell: map<Int, Cell>;
    int_address: map<Int, Address>;
    int_struct: map<Int, SomeStruct>;

    // ===============================
    // Integer (`Int as int8`) Key Maps
    // ===============================

    int8_varint16: map<Int as int8, Int as varint16>;
    int8_varint32: map<Int as int8, Int as varint32>;
    int8_varuint16: map<Int as int8, Int as varuint16>;
    int8_varuint32: map<Int as int8, Int as varuint32>;
    int8_bool: map<Int as int8, Bool>;
    int8_cell: map<Int as int8, Cell>;
    int8_address: map<Int as int8, Address>;
    int8_struct: map<Int as int8, SomeStruct>;

    // ===============================
    // Integer (`Int as int42`) Key Maps
    // ===============================

    int42_varint16: map<Int as int42, Int as varint16>;
    int42_varint32: map<Int as int42, Int as varint32>;
    int42_varuint16: map<Int as int42, Int as varuint16>;
    int42_varuint32: map<Int as int42, Int as varuint32>;
    int42_bool: map<Int as int42, Bool>;
    int42_cell: map<Int as int42, Cell>;
    int42_address: map<Int as int42, Address>;
    int42_struct: map<Int as int42, SomeStruct>;

    // ===============================
    // Integer (`Int as int256`) Key Maps
    // ===============================

    int256_varint16: map<Int as int256, Int as varint16>;
    int256_varint32: map<Int as int256, Int as varint32>;
    int256_varuint16: map<Int as int256, Int as varuint16>;
    int256_varuint32: map<Int as int256, Int as varuint32>;
    int256_bool: map<Int as int256, Bool>;
    int256_cell: map<Int as int256, Cell>;
    int256_address: map<Int as int256, Address>;
    int256_struct: map<Int as int256, SomeStruct>;

    // ===============================
    // Unsigned Integer (`Int as uint8`) Key Maps
    // ===============================

    uint8_varint16: map<Int as uint8, Int as varint16>;
    uint8_varint32: map<Int as uint8, Int as varint32>;
    uint8_varuint16: map<Int as uint8, Int as varuint16>;
    uint8_varuint32: map<Int as uint8, Int as varuint32>;
    uint8_bool: map<Int as uint8, Bool>;
    uint8_cell: map<Int as uint8, Cell>;
    uint8_address: map<Int as uint8, Address>;
    uint8_struct: map<Int as uint8, SomeStruct>;

    // ===============================
    // Unsigned Integer (`Int as uint42`) Key Maps
    // ===============================

    uint42_varint16: map<Int as uint42, Int as varint16>;
    uint42_varint32: map<Int as uint42, Int as varint32>;
    uint42_varuint16: map<Int as uint42, Int as varuint16>;
    uint42_varuint32: map<Int as uint42, Int as varuint32>;
    uint42_bool: map<Int as uint42, Bool>;
    uint42_cell: map<Int as uint42, Cell>;
    uint42_address: map<Int as uint42, Address>;
    uint42_struct: map<Int as uint42, SomeStruct>;

    // ===============================
    // Unsigned Integer (`Int as uint256`) Key Maps
    // ===============================

    uint256_varint16: map<Int as uint256, Int as varint16>;
    uint256_varint32: map<Int as uint256, Int as varint32>;
    uint256_varuint16: map<Int as uint256, Int as varuint16>;
    uint256_varuint32: map<Int as uint256, Int as varuint32>;
    uint256_bool: map<Int as uint256, Bool>;
    uint256_cell: map<Int as uint256, Cell>;
    uint256_address: map<Int as uint256, Address>;
    uint256_struct: map<Int as uint256, SomeStruct>;

    // ===============================
    // Address Key Maps
    // ===============================

    address_varint16: map<Address, Int as varint16>;
    address_varint32: map<Address, Int as varint32>;
    address_varuint16: map<Address, Int as varuint16>;
    address_varuint32: map<Address, Int as varuint32>;
    address_bool: map<Address, Bool>;
    address_cell: map<Address, Cell>;
    address_address: map<Address, Address>;
    address_struct: map<Address, SomeStruct>;

    // ===============================
    // Receivers For Operations
    // ===============================

    receive(msg: SetAllMaps) {
        // Integer Key Maps
        self.int_varint16.set(msg.keyInt, msg.valueVarint16);
        self.int_varint32.set(msg.keyInt, msg.valueVarint32);
        self.int_varuint16.set(msg.keyInt, msg.valueVaruint16);
        self.int_varuint32.set(msg.keyInt, msg.valueVaruint32);
        self.int_bool.set(msg.keyInt, msg.valueBool);
        self.int_cell.set(msg.keyInt, msg.valueCell);
        self.int_address.set(msg.keyInt, msg.valueAddress);
        self.int_struct.set(msg.keyInt, msg.valueStruct);

        self.int8_varint16.set(msg.keyInt8, msg.valueVarint16);
        self.int8_varint32.set(msg.keyInt8, msg.valueVarint32);
        self.int8_varuint16.set(msg.keyInt8, msg.valueVaruint16);
        self.int8_varuint32.set(msg.keyInt8, msg.valueVaruint32);
        self.int8_bool.set(msg.keyInt8, msg.valueBool);
        self.int8_cell.set(msg.keyInt8, msg.valueCell);
        self.int8_address.set(msg.keyInt8, msg.valueAddress);
        self.int8_struct.set(msg.keyInt8, msg.valueStruct);

        self.int42_varint16.set(msg.keyInt42, msg.valueVarint16);
        self.int42_varint32.set(msg.keyInt42, msg.valueVarint32);
        self.int42_varuint16.set(msg.keyInt42, msg.valueVaruint16);
        self.int42_varuint32.set(msg.keyInt42, msg.valueVaruint32);
        self.int42_bool.set(msg.keyInt42, msg.valueBool);
        self.int42_cell.set(msg.keyInt42, msg.valueCell);
        self.int42_address.set(msg.keyInt42, msg.valueAddress);
        self.int42_struct.set(msg.keyInt42, msg.valueStruct);

        self.int256_varint16.set(msg.keyInt256, msg.valueVarint16);
        self.int256_varint32.set(msg.keyInt256, msg.valueVarint32);
        self.int256_varuint16.set(msg.keyInt256, msg.valueVaruint16);
        self.int256_varuint32.set(msg.keyInt256, msg.valueVaruint32);
        self.int256_bool.set(msg.keyInt256, msg.valueBool);
        self.int256_cell.set(msg.keyInt256, msg.valueCell);
        self.int256_address.set(msg.keyInt256, msg.valueAddress);
        self.int256_struct.set(msg.keyInt256, msg.valueStruct);

        self.uint8_varint16.set(msg.keyUint8, msg.valueVarint16);
        self.uint8_varint32.set(msg.keyUint8, msg.valueVarint32);
        self.uint8_varuint16.set(msg.keyUint8, msg.valueVaruint16);
        self.uint8_varuint32.set(msg.keyUint8, msg.valueVaruint32);
        self.uint8_bool.set(msg.keyUint8, msg.valueBool);
        self.uint8_cell.set(msg.keyUint8, msg.valueCell);
        self.uint8_address.set(msg.keyUint8, msg.valueAddress);
        self.uint8_struct.set(msg.keyUint8, msg.valueStruct);

        self.uint42_varint16.set(msg.keyUint42, msg.valueVarint16);
        self.uint42_varint32.set(msg.keyUint42, msg.valueVarint32);
        self.uint42_varuint16.set(msg.keyUint42, msg.valueVaruint16);
        self.uint42_varuint32.set(msg.keyUint42, msg.valueVaruint32);
        self.uint42_bool.set(msg.keyUint42, msg.valueBool);
        self.uint42_cell.set(msg.keyUint42, msg.valueCell);
        self.uint42_address.set(msg.keyUint42, msg.valueAddress);
        self.uint42_struct.set(msg.keyUint42, msg.valueStruct);

        self.uint256_varint16.set(msg.keyUint256, msg.valueVarint16);
        self.uint256_varint32.set(msg.keyUint256, msg.valueVarint32);
        self.uint256_varuint16.set(msg.keyUint256, msg.valueVaruint16);
        self.uint256_varuint32.set(msg.keyUint256, msg.valueVaruint32);
        self.uint256_bool.set(msg.keyUint256, msg.valueBool);
        self.uint256_cell.set(msg.keyUint256, msg.valueCell);
        self.uint256_address.set(msg.keyUint256, msg.valueAddress);
        self.uint256_struct.set(msg.keyUint256, msg.valueStruct);

        // Address Key Maps
        self.address_varint16.set(msg.keyAddress, msg.valueVarint16);
        self.address_varint32.set(msg.keyAddress, msg.valueVarint32);
        self.address_varuint16.set(msg.keyAddress, msg.valueVaruint16);
        self.address_varuint32.set(msg.keyAddress, msg.valueVaruint32);
        self.address_bool.set(msg.keyAddress, msg.valueBool);
        self.address_cell.set(msg.keyAddress, msg.valueCell);
        self.address_address.set(msg.keyAddress, msg.valueAddress);
        self.address_struct.set(msg.keyAddress, msg.valueStruct);
    }

    receive(msg: DelAllMaps) {
        // Integer Key Maps
        self.int_varint16.del(msg.keyInt);
        self.int_varint32.del(msg.keyInt);
        self.int_varuint16.del(msg.keyInt);
        self.int_varuint32.del(msg.keyInt);
        self.int_bool.del(msg.keyInt);
        self.int_cell.del(msg.keyInt);
        self.int_address.del(msg.keyInt);
        self.int_struct.del(msg.keyInt);

        self.int8_varint16.del(msg.keyInt8);
        self.int8_varint32.del(msg.keyInt8);
        self.int8_varuint16.del(msg.keyInt8);
        self.int8_varuint32.del(msg.keyInt8);
        self.int8_bool.del(msg.keyInt8);
        self.int8_cell.del(msg.keyInt8);
        self.int8_address.del(msg.keyInt8);
        self.int8_struct.del(msg.keyInt8);

        self.int42_varint16.del(msg.keyInt42);
        self.int42_varint32.del(msg.keyInt42);
        self.int42_varuint16.del(msg.keyInt42);
        self.int42_varuint32.del(msg.keyInt42);
        self.int42_bool.del(msg.keyInt42);
        self.int42_cell.del(msg.keyInt42);
        self.int42_address.del(msg.keyInt42);
        self.int42_struct.del(msg.keyInt42);

        self.int256_varint16.del(msg.keyInt256);
        self.int256_varint32.del(msg.keyInt256);
        self.int256_varuint16.del(msg.keyInt256);
        self.int256_varuint32.del(msg.keyInt256);
        self.int256_bool.del(msg.keyInt256);
        self.int256_cell.del(msg.keyInt256);
        self.int256_address.del(msg.keyInt256);
        self.int256_struct.del(msg.keyInt256);

        self.uint8_varint16.del(msg.keyUint8);
        self.uint8_varint32.del(msg.keyUint8);
        self.uint8_varuint16.del(msg.keyUint8);
        self.uint8_varuint32.del(msg.keyUint8);
        self.uint8_bool.del(msg.keyUint8);
        self.uint8_cell.del(msg.keyUint8);
        self.uint8_address.del(msg.keyUint8);
        self.uint8_struct.del(msg.keyUint8);

        self.uint42_varint16.del(msg.keyUint42);
        self.uint42_varint32.del(msg.keyUint42);
        self.uint42_varuint16.del(msg.keyUint42);
        self.uint42_varuint32.del(msg.keyUint42);
        self.uint42_bool.del(msg.keyUint42);
        self.uint42_cell.del(msg.keyUint42);
        self.uint42_address.del(msg.keyUint42);
        self.uint42_struct.del(msg.keyUint42);

        self.uint256_varint16.del(msg.keyUint256);
        self.uint256_varint32.del(msg.keyUint256);
        self.uint256_varuint16.del(msg.keyUint256);
        self.uint256_varuint32.del(msg.keyUint256);
        self.uint256_bool.del(msg.keyUint256);
        self.uint256_cell.del(msg.keyUint256);
        self.uint256_address.del(msg.keyUint256);
        self.uint256_struct.del(msg.keyUint256);

        // Address Key Maps
        self.address_varint16.del(msg.keyAddress);
        self.address_varint32.del(msg.keyAddress);
        self.address_varuint16.del(msg.keyAddress);
        self.address_varuint32.del(msg.keyAddress);
        self.address_bool.del(msg.keyAddress);
        self.address_cell.del(msg.keyAddress);
        self.address_address.del(msg.keyAddress);
        self.address_struct.del(msg.keyAddress);
    }

    receive(msg: ReplaceAllMaps) {
        // Replace operations analogous to coins, now including varint16, varint32, varuint16, varuint32
        self.int_varint16.replace(msg.keyInt, msg.valueVarint16);
        self.int_varint32.replace(msg.keyInt, msg.valueVarint32);
        self.int_varuint16.replace(msg.keyInt, msg.valueVaruint16);
        self.int_varuint32.replace(msg.keyInt, msg.valueVaruint32);
        self.int_bool.replace(msg.keyInt, msg.valueBool);
        self.int_cell.replace(msg.keyInt, msg.valueCell);
        self.int_address.replace(msg.keyInt, msg.valueAddress);
        self.int_struct.replace(msg.keyInt, msg.valueStruct);

        self.int8_varint16.replace(msg.keyInt8, msg.valueVarint16);
        self.int8_varint32.replace(msg.keyInt8, msg.valueVarint32);
        self.int8_varuint16.replace(msg.keyInt8, msg.valueVaruint16);
        self.int8_varuint32.replace(msg.keyInt8, msg.valueVaruint32);
        self.int8_bool.replace(msg.keyInt8, msg.valueBool);
        self.int8_cell.replace(msg.keyInt8, msg.valueCell);
        self.int8_address.replace(msg.keyInt8, msg.valueAddress);
        self.int8_struct.replace(msg.keyInt8, msg.valueStruct);

        self.int42_varint16.replace(msg.keyInt42, msg.valueVarint16);
        self.int42_varint32.replace(msg.keyInt42, msg.valueVarint32);
        self.int42_varuint16.replace(msg.keyInt42, msg.valueVaruint16);
        self.int42_varuint32.replace(msg.keyInt42, msg.valueVaruint32);
        self.int42_bool.replace(msg.keyInt42, msg.valueBool);
        self.int42_cell.replace(msg.keyInt42, msg.valueCell);
        self.int42_address.replace(msg.keyInt42, msg.valueAddress);
        self.int42_struct.replace(msg.keyInt42, msg.valueStruct);

        self.int256_varint16.replace(msg.keyInt256, msg.valueVarint16);
        self.int256_varint32.replace(msg.keyInt256, msg.valueVarint32);
        self.int256_varuint16.replace(msg.keyInt256, msg.valueVaruint16);
        self.int256_varuint32.replace(msg.keyInt256, msg.valueVaruint32);
        self.int256_bool.replace(msg.keyInt256, msg.valueBool);
        self.int256_cell.replace(msg.keyInt256, msg.valueCell);
        self.int256_address.replace(msg.keyInt256, msg.valueAddress);
        self.int256_struct.replace(msg.keyInt256, msg.valueStruct);

        self.uint8_varint16.replace(msg.keyUint8, msg.valueVarint16);
        self.uint8_varint32.replace(msg.keyUint8, msg.valueVarint32);
        self.uint8_varuint16.replace(msg.keyUint8, msg.valueVaruint16);
        self.uint8_varuint32.replace(msg.keyUint8, msg.valueVaruint32);
        self.uint8_bool.replace(msg.keyUint8, msg.valueBool);
        self.uint8_cell.replace(msg.keyUint8, msg.valueCell);
        self.uint8_address.replace(msg.keyUint8, msg.valueAddress);
        self.uint8_struct.replace(msg.keyUint8, msg.valueStruct);

        self.uint42_varint16.replace(msg.keyUint42, msg.valueVarint16);
        self.uint42_varint32.replace(msg.keyUint42, msg.valueVarint32);
        self.uint42_varuint16.replace(msg.keyUint42, msg.valueVaruint16);
        self.uint42_varuint32.replace(msg.keyUint42, msg.valueVaruint32);
        self.uint42_bool.replace(msg.keyUint42, msg.valueBool);
        self.uint42_cell.replace(msg.keyUint42, msg.valueCell);
        self.uint42_address.replace(msg.keyUint42, msg.valueAddress);
        self.uint42_struct.replace(msg.keyUint42, msg.valueStruct);

        self.uint256_varint16.replace(msg.keyUint256, msg.valueVarint16);
        self.uint256_varint32.replace(msg.keyUint256, msg.valueVarint32);
        self.uint256_varuint16.replace(msg.keyUint256, msg.valueVaruint16);
        self.uint256_varuint32.replace(msg.keyUint256, msg.valueVaruint32);
        self.uint256_bool.replace(msg.keyUint256, msg.valueBool);
        self.uint256_cell.replace(msg.keyUint256, msg.valueCell);
        self.uint256_address.replace(msg.keyUint256, msg.valueAddress);
        self.uint256_struct.replace(msg.keyUint256, msg.valueStruct);

        // Address Key Maps
        self.address_varint16.replace(msg.keyAddress, msg.valueVarint16);
        self.address_varint32.replace(msg.keyAddress, msg.valueVarint32);
        self.address_varuint16.replace(msg.keyAddress, msg.valueVaruint16);
        self.address_varuint32.replace(msg.keyAddress, msg.valueVaruint32);
        self.address_bool.replace(msg.keyAddress, msg.valueBool);
        self.address_cell.replace(msg.keyAddress, msg.valueCell);
        self.address_address.replace(msg.keyAddress, msg.valueAddress);
        self.address_struct.replace(msg.keyAddress, msg.valueStruct);
    }

    receive(msg: ReplaceGetAllMaps) {
        // Similar to above, but calling replaceGet
        self.int_varint16.replaceGet(msg.keyInt, msg.valueVarint16);
        self.int_varint32.replaceGet(msg.keyInt, msg.valueVarint32);
        self.int_varuint16.replaceGet(msg.keyInt, msg.valueVaruint16);
        self.int_varuint32.replaceGet(msg.keyInt, msg.valueVaruint32);
        self.int_bool.replaceGet(msg.keyInt, msg.valueBool);
        self.int_cell.replaceGet(msg.keyInt, msg.valueCell);
        self.int_address.replaceGet(msg.keyInt, msg.valueAddress);
        self.int_struct.replaceGet(msg.keyInt, msg.valueStruct);

        self.int8_varint16.replaceGet(msg.keyInt8, msg.valueVarint16);
        self.int8_varint32.replaceGet(msg.keyInt8, msg.valueVarint32);
        self.int8_varuint16.replaceGet(msg.keyInt8, msg.valueVaruint16);
        self.int8_varuint32.replaceGet(msg.keyInt8, msg.valueVaruint32);
        self.int8_bool.replaceGet(msg.keyInt8, msg.valueBool);
        self.int8_cell.replaceGet(msg.keyInt8, msg.valueCell);
        self.int8_address.replaceGet(msg.keyInt8, msg.valueAddress);
        self.int8_struct.replaceGet(msg.keyInt8, msg.valueStruct);

        self.int42_varint16.replaceGet(msg.keyInt42, msg.valueVarint16);
        self.int42_varint32.replaceGet(msg.keyInt42, msg.valueVarint32);
        self.int42_varuint16.replaceGet(msg.keyInt42, msg.valueVaruint16);
        self.int42_varuint32.replaceGet(msg.keyInt42, msg.valueVaruint32);
        self.int42_bool.replaceGet(msg.keyInt42, msg.valueBool);
        self.int42_cell.replaceGet(msg.keyInt42, msg.valueCell);
        self.int42_address.replaceGet(msg.keyInt42, msg.valueAddress);
        self.int42_struct.replaceGet(msg.keyInt42, msg.valueStruct);

        self.int256_varint16.replaceGet(msg.keyInt256, msg.valueVarint16);
        self.int256_varint32.replaceGet(msg.keyInt256, msg.valueVarint32);
        self.int256_varuint16.replaceGet(msg.keyInt256, msg.valueVaruint16);
        self.int256_varuint32.replaceGet(msg.keyInt256, msg.valueVaruint32);
        self.int256_bool.replaceGet(msg.keyInt256, msg.valueBool);
        self.int256_cell.replaceGet(msg.keyInt256, msg.valueCell);
        self.int256_address.replaceGet(msg.keyInt256, msg.valueAddress);
        self.int256_struct.replaceGet(msg.keyInt256, msg.valueStruct);

        self.uint8_varint16.replaceGet(msg.keyUint8, msg.valueVarint16);
        self.uint8_varint32.replaceGet(msg.keyUint8, msg.valueVarint32);
        self.uint8_varuint16.replaceGet(msg.keyUint8, msg.valueVaruint16);
        self.uint8_varuint32.replaceGet(msg.keyUint8, msg.valueVaruint32);
        self.uint8_bool.replaceGet(msg.keyUint8, msg.valueBool);
        self.uint8_cell.replaceGet(msg.keyUint8, msg.valueCell);
        self.uint8_address.replaceGet(msg.keyUint8, msg.valueAddress);
        self.uint8_struct.replaceGet(msg.keyUint8, msg.valueStruct);

        self.uint42_varint16.replaceGet(msg.keyUint42, msg.valueVarint16);
        self.uint42_varint32.replaceGet(msg.keyUint42, msg.valueVarint32);
        self.uint42_varuint16.replaceGet(msg.keyUint42, msg.valueVaruint16);
        self.uint42_varuint32.replaceGet(msg.keyUint42, msg.valueVaruint32);
        self.uint42_bool.replaceGet(msg.keyUint42, msg.valueBool);
        self.uint42_cell.replaceGet(msg.keyUint42, msg.valueCell);
        self.uint42_address.replaceGet(msg.keyUint42, msg.valueAddress);
        self.uint42_struct.replaceGet(msg.keyUint42, msg.valueStruct);

        self.uint256_varint16.replaceGet(msg.keyUint256, msg.valueVarint16);
        self.uint256_varint32.replaceGet(msg.keyUint256, msg.valueVarint32);
        self.uint256_varuint16.replaceGet(msg.keyUint256, msg.valueVaruint16);
        self.uint256_varuint32.replaceGet(msg.keyUint256, msg.valueVaruint32);
        self.uint256_bool.replaceGet(msg.keyUint256, msg.valueBool);
        self.uint256_cell.replaceGet(msg.keyUint256, msg.valueCell);
        self.uint256_address.replaceGet(msg.keyUint256, msg.valueAddress);
        self.uint256_struct.replaceGet(msg.keyUint256, msg.valueStruct);

        // Address Key Maps
        self.address_varint16.replaceGet(msg.keyAddress, msg.valueVarint16);
        self.address_varint32.replaceGet(msg.keyAddress, msg.valueVarint32);
        self.address_varuint16.replaceGet(msg.keyAddress, msg.valueVaruint16);
        self.address_varuint32.replaceGet(msg.keyAddress, msg.valueVaruint32);
        self.address_bool.replaceGet(msg.keyAddress, msg.valueBool);
        self.address_cell.replaceGet(msg.keyAddress, msg.valueCell);
        self.address_address.replaceGet(msg.keyAddress, msg.valueAddress);
        self.address_struct.replaceGet(msg.keyAddress, msg.valueStruct);
    }

    // ===============================
    // Getters
    // ===============================

    get fun allMaps(): MapTestContract {
        return self;
    }

    get fun getAllMaps(
        keyInt: Int,
        keyInt8: Int,
        keyInt42: Int,
        keyInt256: Int,
        keyUint8: Int,
        keyUint42: Int,
        keyUint256: Int,
        keyAddress: Address
    ): GetAllMapsResult {
        return GetAllMapsResult {
            // Integer Key Maps
            int_varint16: self.int_varint16.get(keyInt),
            int_varint32: self.int_varint32.get(keyInt),
            int_varuint16: self.int_varuint16.get(keyInt),
            int_varuint32: self.int_varuint32.get(keyInt),
            int_bool: self.int_bool.get(keyInt),
            int_cell: self.int_cell.get(keyInt),
            int_address: self.int_address.get(keyInt),
            int_struct: self.int_struct.get(keyInt),

            int8_varint16: self.int8_varint16.get(keyInt8),
            int8_varint32: self.int8_varint32.get(keyInt8),
            int8_varuint16: self.int8_varuint16.get(keyInt8),
            int8_varuint32: self.int8_varuint32.get(keyInt8),
            int8_bool: self.int8_bool.get(keyInt8),
            int8_cell: self.int8_cell.get(keyInt8),
            int8_address: self.int8_address.get(keyInt8),
            int8_struct: self.int8_struct.get(keyInt8),

            int42_varint16: self.int42_varint16.get(keyInt42),
            int42_varint32: self.int42_varint32.get(keyInt42),
            int42_varuint16: self.int42_varuint16.get(keyInt42),
            int42_varuint32: self.int42_varuint32.get(keyInt42),
            int42_bool: self.int42_bool.get(keyInt42),
            int42_cell: self.int42_cell.get(keyInt42),
            int42_address: self.int42_address.get(keyInt42),
            int42_struct: self.int42_struct.get(keyInt42),

            int256_varint16: self.int256_varint16.get(keyInt256),
            int256_varint32: self.int256_varint32.get(keyInt256),
            int256_varuint16: self.int256_varuint16.get(keyInt256),
            int256_varuint32: self.int256_varuint32.get(keyInt256),
            int256_bool: self.int256_bool.get(keyInt256),
            int256_cell: self.int256_cell.get(keyInt256),
            int256_address: self.int256_address.get(keyInt256),
            int256_struct: self.int256_struct.get(keyInt256),

            uint8_varint16: self.uint8_varint16.get(keyUint8),
            uint8_varint32: self.uint8_varint32.get(keyUint8),
            uint8_varuint16: self.uint8_varuint16.get(keyUint8),
            uint8_varuint32: self.uint8_varuint32.get(keyUint8),
            uint8_bool: self.uint8_bool.get(keyUint8),
            uint8_cell: self.uint8_cell.get(keyUint8),
            uint8_address: self.uint8_address.get(keyUint8),
            uint8_struct: self.uint8_struct.get(keyUint8),

            uint42_varint16: self.uint42_varint16.get(keyUint42),
            uint42_varint32: self.uint42_varint32.get(keyUint42),
            uint42_varuint16: self.uint42_varuint16.get(keyUint42),
            uint42_varuint32: self.uint42_varuint32.get(keyUint42),
            uint42_bool: self.uint42_bool.get(keyUint42),
            uint42_cell: self.uint42_cell.get(keyUint42),
            uint42_address: self.uint42_address.get(keyUint42),
            uint42_struct: self.uint42_struct.get(keyUint42),

            uint256_varint16: self.uint256_varint16.get(keyUint256),
            uint256_varint32: self.uint256_varint32.get(keyUint256),
            uint256_varuint16: self.uint256_varuint16.get(keyUint256),
            uint256_varuint32: self.uint256_varuint32.get(keyUint256),
            uint256_bool: self.uint256_bool.get(keyUint256),
            uint256_cell: self.uint256_cell.get(keyUint256),
            uint256_address: self.uint256_address.get(keyUint256),
            uint256_struct: self.uint256_struct.get(keyUint256),

            // Address Key Maps
            address_varint16: self.address_varint16.get(keyAddress),
            address_varint32: self.address_varint32.get(keyAddress),
            address_varuint16: self.address_varuint16.get(keyAddress),
            address_varuint32: self.address_varuint32.get(keyAddress),
            address_bool: self.address_bool.get(keyAddress),
            address_cell: self.address_cell.get(keyAddress),
            address_address: self.address_address.get(keyAddress),
            address_struct: self.address_struct.get(keyAddress)
        };
    }

    get fun replaceAllMaps(
        keyInt: Int,
        keyInt8: Int,
        keyInt42: Int,
        keyInt256: Int,
        keyUint8: Int,
        keyUint42: Int,
        keyUint256: Int,
        keyAddress: Address,
        valueVarint16: Int,
        valueVarint32: Int,
        valueVaruint16: Int,
        valueVaruint32: Int,
        valueBool: Bool,
        valueCell: Cell,
        valueAddress: Address,
        valueStruct: SomeStruct
    ): ReplaceAllMapsResult {
        return ReplaceAllMapsResult {
            // Integer Key Maps
            int_varint16: self.int_varint16.replace(keyInt, valueVarint16),
            int_varint32: self.int_varint32.replace(keyInt, valueVarint32),
            int_varuint16: self.int_varuint16.replace(keyInt, valueVaruint16),
            int_varuint32: self.int_varuint32.replace(keyInt, valueVaruint32),
            int_bool: self.int_bool.replace(keyInt, valueBool),
            int_cell: self.int_cell.replace(keyInt, valueCell),
            int_address: self.int_address.replace(keyInt, valueAddress),
            int_struct: self.int_struct.replace(keyInt, valueStruct),

            int8_varint16: self.int8_varint16.replace(keyInt8, valueVarint16),
            int8_varint32: self.int8_varint32.replace(keyInt8, valueVarint32),
            int8_varuint16: self.int8_varuint16.replace(keyInt8, valueVaruint16),
            int8_varuint32: self.int8_varuint32.replace(keyInt8, valueVaruint32),
            int8_bool: self.int8_bool.replace(keyInt8, valueBool),
            int8_cell: self.int8_cell.replace(keyInt8, valueCell),
            int8_address: self.int8_address.replace(keyInt8, valueAddress),
            int8_struct: self.int8_struct.replace(keyInt8, valueStruct),

            int42_varint16: self.int42_varint16.replace(keyInt42, valueVarint16),
            int42_varint32: self.int42_varint32.replace(keyInt42, valueVarint32),
            int42_varuint16: self.int42_varuint16.replace(keyInt42, valueVaruint16),
            int42_varuint32: self.int42_varuint32.replace(keyInt42, valueVaruint32),
            int42_bool: self.int42_bool.replace(keyInt42, valueBool),
            int42_cell: self.int42_cell.replace(keyInt42, valueCell),
            int42_address: self.int42_address.replace(keyInt42, valueAddress),
            int42_struct: self.int42_struct.replace(keyInt42, valueStruct),

            int256_varint16: self.int256_varint16.replace(keyInt256, valueVarint16),
            int256_varint32: self.int256_varint32.replace(keyInt256, valueVarint32),
            int256_varuint16: self.int256_varuint16.replace(keyInt256, valueVaruint16),
            int256_varuint32: self.int256_varuint32.replace(keyInt256, valueVaruint32),
            int256_bool: self.int256_bool.replace(keyInt256, valueBool),
            int256_cell: self.int256_cell.replace(keyInt256, valueCell),
            int256_address: self.int256_address.replace(keyInt256, valueAddress),
            int256_struct: self.int256_struct.replace(keyInt256, valueStruct),

            uint8_varint16: self.uint8_varint16.replace(keyUint8, valueVarint16),
            uint8_varint32: self.uint8_varint32.replace(keyUint8, valueVarint32),
            uint8_varuint16: self.uint8_varuint16.replace(keyUint8, valueVaruint16),
            uint8_varuint32: self.uint8_varuint32.replace(keyUint8, valueVaruint32),
            uint8_bool: self.uint8_bool.replace(keyUint8, valueBool),
            uint8_cell: self.uint8_cell.replace(keyUint8, valueCell),
            uint8_address: self.uint8_address.replace(keyUint8, valueAddress),
            uint8_struct: self.uint8_struct.replace(keyUint8, valueStruct),

            uint42_varint16: self.uint42_varint16.replace(keyUint42, valueVarint16),
            uint42_varint32: self.uint42_varint32.replace(keyUint42, valueVarint32),
            uint42_varuint16: self.uint42_varuint16.replace(keyUint42, valueVaruint16),
            uint42_varuint32: self.uint42_varuint32.replace(keyUint42, valueVaruint32),
            uint42_bool: self.uint42_bool.replace(keyUint42, valueBool),
            uint42_cell: self.uint42_cell.replace(keyUint42, valueCell),
            uint42_address: self.uint42_address.replace(keyUint42, valueAddress),
            uint42_struct: self.uint42_struct.replace(keyUint42, valueStruct),

            uint256_varint16: self.uint256_varint16.replace(keyUint256, valueVarint16),
            uint256_varint32: self.uint256_varint32.replace(keyUint256, valueVarint32),
            uint256_varuint16: self.uint256_varuint16.replace(keyUint256, valueVaruint16),
            uint256_varuint32: self.uint256_varuint32.replace(keyUint256, valueVaruint32),
            uint256_bool: self.uint256_bool.replace(keyUint256, valueBool),
            uint256_cell: self.uint256_cell.replace(keyUint256, valueCell),
            uint256_address: self.uint256_address.replace(keyUint256, valueAddress),
            uint256_struct: self.uint256_struct.replace(keyUint256, valueStruct),

            // Address Key Maps
            address_varint16: self.address_varint16.replace(keyAddress, valueVarint16),
            address_varint32: self.address_varint32.replace(keyAddress, valueVarint32),
            address_varuint16: self.address_varuint16.replace(keyAddress, valueVaruint16),
            address_varuint32: self.address_varuint32.replace(keyAddress, valueVaruint32),
            address_bool: self.address_bool.replace(keyAddress, valueBool),
            address_cell: self.address_cell.replace(keyAddress, valueCell),
            address_address: self.address_address.replace(keyAddress, valueAddress),
            address_struct: self.address_struct.replace(keyAddress, valueStruct)
        };
    }

    get fun replaceGetAllMaps(
        keyInt: Int,
        keyInt8: Int,
        keyInt42: Int,
        keyInt256: Int,
        keyUint8: Int,
        keyUint42: Int,
        keyUint256: Int,
        keyAddress: Address,
        valueVarint16: Int,
        valueVarint32: Int,
        valueVaruint16: Int,
        valueVaruint32: Int,
        valueBool: Bool,
        valueCell: Cell,
        valueAddress: Address,
        valueStruct: SomeStruct
    ): ReplaceGetAllMapsResult {
        return ReplaceGetAllMapsResult {
            // Integer Key Maps
            int_varint16: self.int_varint16.replaceGet(keyInt, valueVarint16),
            int_varint32: self.int_varint32.replaceGet(keyInt, valueVarint32),
            int_varuint16: self.int_varuint16.replaceGet(keyInt, valueVaruint16),
            int_varuint32: self.int_varuint32.replaceGet(keyInt, valueVaruint32),
            int_bool: self.int_bool.replaceGet(keyInt, valueBool),
            int_cell: self.int_cell.replaceGet(keyInt, valueCell),
            int_address: self.int_address.replaceGet(keyInt, valueAddress),
            int_struct: self.int_struct.replaceGet(keyInt, valueStruct),

            int8_varint16: self.int8_varint16.replaceGet(keyInt8, valueVarint16),
            int8_varint32: self.int8_varint32.replaceGet(keyInt8, valueVarint32),
            int8_varuint16: self.int8_varuint16.replaceGet(keyInt8, valueVaruint16),
            int8_varuint32: self.int8_varuint32.replaceGet(keyInt8, valueVaruint32),
            int8_bool: self.int8_bool.replaceGet(keyInt8, valueBool),
            int8_cell: self.int8_cell.replaceGet(keyInt8, valueCell),
            int8_address: self.int8_address.replaceGet(keyInt8, valueAddress),
            int8_struct: self.int8_struct.replaceGet(keyInt8, valueStruct),

            int42_varint16: self.int42_varint16.replaceGet(keyInt42, valueVarint16),
            int42_varint32: self.int42_varint32.replaceGet(keyInt42, valueVarint32),
            int42_varuint16: self.int42_varuint16.replaceGet(keyInt42, valueVaruint16),
            int42_varuint32: self.int42_varuint32.replaceGet(keyInt42, valueVaruint32),
            int42_bool: self.int42_bool.replaceGet(keyInt42, valueBool),
            int42_cell: self.int42_cell.replaceGet(keyInt42, valueCell),
            int42_address: self.int42_address.replaceGet(keyInt42, valueAddress),
            int42_struct: self.int42_struct.replaceGet(keyInt42, valueStruct),

            int256_varint16: self.int256_varint16.replaceGet(keyInt256, valueVarint16),
            int256_varint32: self.int256_varint32.replaceGet(keyInt256, valueVarint32),
            int256_varuint16: self.int256_varuint16.replaceGet(keyInt256, valueVaruint16),
            int256_varuint32: self.int256_varuint32.replaceGet(keyInt256, valueVaruint32),
            int256_bool: self.int256_bool.replaceGet(keyInt256, valueBool),
            int256_cell: self.int256_cell.replaceGet(keyInt256, valueCell),
            int256_address: self.int256_address.replaceGet(keyInt256, valueAddress),
            int256_struct: self.int256_struct.replaceGet(keyInt256, valueStruct),

            uint8_varint16: self.uint8_varint16.replaceGet(keyUint8, valueVarint16),
            uint8_varint32: self.uint8_varint32.replaceGet(keyUint8, valueVarint32),
            uint8_varuint16: self.uint8_varuint16.replaceGet(keyUint8, valueVaruint16),
            uint8_varuint32: self.uint8_varuint32.replaceGet(keyUint8, valueVaruint32),
            uint8_bool: self.uint8_bool.replaceGet(keyUint8, valueBool),
            uint8_cell: self.uint8_cell.replaceGet(keyUint8, valueCell),
            uint8_address: self.uint8_address.replaceGet(keyUint8, valueAddress),
            uint8_struct: self.uint8_struct.replaceGet(keyUint8, valueStruct),

            uint42_varint16: self.uint42_varint16.replaceGet(keyUint42, valueVarint16),
            uint42_varint32: self.uint42_varint32.replaceGet(keyUint42, valueVarint32),
            uint42_varuint16: self.uint42_varuint16.replaceGet(keyUint42, valueVaruint16),
            uint42_varuint32: self.uint42_varuint32.replaceGet(keyUint42, valueVaruint32),
            uint42_bool: self.uint42_bool.replaceGet(keyUint42, valueBool),
            uint42_cell: self.uint42_cell.replaceGet(keyUint42, valueCell),
            uint42_address: self.uint42_address.replaceGet(keyUint42, valueAddress),
            uint42_struct: self.uint42_struct.replaceGet(keyUint42, valueStruct),

            uint256_varint16: self.uint256_varint16.replaceGet(keyUint256, valueVarint16),
            uint256_varint32: self.uint256_varint32.replaceGet(keyUint256, valueVarint32),
            uint256_varuint16: self.uint256_varuint16.replaceGet(keyUint256, valueVaruint16),
            uint256_varuint32: self.uint256_varuint32.replaceGet(keyUint256, valueVaruint32),
            uint256_bool: self.uint256_bool.replaceGet(keyUint256, valueBool),
            uint256_cell: self.uint256_cell.replaceGet(keyUint256, valueCell),
            uint256_address: self.uint256_address.replaceGet(keyUint256, valueAddress),
            uint256_struct: self.uint256_struct.replaceGet(keyUint256, valueStruct),

            // Address Key Maps
            address_varint16: self.address_varint16.replaceGet(keyAddress, valueVarint16),
            address_varint32: self.address_varint32.replaceGet(keyAddress, valueVarint32),
            address_varuint16: self.address_varuint16.replaceGet(keyAddress, valueVaruint16),
            address_varuint32: self.address_varuint32.replaceGet(keyAddress, valueVaruint32),
            address_bool: self.address_bool.replaceGet(keyAddress, valueBool),
            address_cell: self.address_cell.replaceGet(keyAddress, valueCell),
            address_address: self.address_address.replaceGet(keyAddress, valueAddress),
            address_struct: self.address_struct.replaceGet(keyAddress, valueStruct)
        };
    }

    get fun existsAllMaps(
        keyInt: Int,
        keyInt8: Int,
        keyInt42: Int,
        keyInt256: Int,
        keyUint8: Int,
        keyUint42: Int,
        keyUint256: Int,
        keyAddress: Address
    ): ExistsAllMapsResult {
        return ExistsAllMapsResult {
            // Integer Key Maps
            int_varint16: self.int_varint16.exists(keyInt),
            int_varint32: self.int_varint32.exists(keyInt),
            int_varuint16: self.int_varuint16.exists(keyInt),
            int_varuint32: self.int_varuint32.exists(keyInt),
            int_bool: self.int_bool.exists(keyInt),
            int_cell: self.int_cell.exists(keyInt),
            int_address: self.int_address.exists(keyInt),
            int_struct: self.int_struct.exists(keyInt),

            int8_varint16: self.int8_varint16.exists(keyInt8),
            int8_varint32: self.int8_varint32.exists(keyInt8),
            int8_varuint16: self.int8_varuint16.exists(keyInt8),
            int8_varuint32: self.int8_varuint32.exists(keyInt8),
            int8_bool: self.int8_bool.exists(keyInt8),
            int8_cell: self.int8_cell.exists(keyInt8),
            int8_address: self.int8_address.exists(keyInt8),
            int8_struct: self.int8_struct.exists(keyInt8),

            int42_varint16: self.int42_varint16.exists(keyInt42),
            int42_varint32: self.int42_varint32.exists(keyInt42),
            int42_varuint16: self.int42_varuint16.exists(keyInt42),
            int42_varuint32: self.int42_varuint32.exists(keyInt42),
            int42_bool: self.int42_bool.exists(keyInt42),
            int42_cell: self.int42_cell.exists(keyInt42),
            int42_address: self.int42_address.exists(keyInt42),
            int42_struct: self.int42_struct.exists(keyInt42),

            int256_varint16: self.int256_varint16.exists(keyInt256),
            int256_varint32: self.int256_varint32.exists(keyInt256),
            int256_varuint16: self.int256_varuint16.exists(keyInt256),
            int256_varuint32: self.int256_varuint32.exists(keyInt256),
            int256_bool: self.int256_bool.exists(keyInt256),
            int256_cell: self.int256_cell.exists(keyInt256),
            int256_address: self.int256_address.exists(keyInt256),
            int256_struct: self.int256_struct.exists(keyInt256),

            uint8_varint16: self.uint8_varint16.exists(keyUint8),
            uint8_varint32: self.uint8_varint32.exists(keyUint8),
            uint8_varuint16: self.uint8_varuint16.exists(keyUint8),
            uint8_varuint32: self.uint8_varuint32.exists(keyUint8),
            uint8_bool: self.uint8_bool.exists(keyUint8),
            uint8_cell: self.uint8_cell.exists(keyUint8),
            uint8_address: self.uint8_address.exists(keyUint8),
            uint8_struct: self.uint8_struct.exists(keyUint8),

            uint42_varint16: self.uint42_varint16.exists(keyUint42),
            uint42_varint32: self.uint42_varint32.exists(keyUint42),
            uint42_varuint16: self.uint42_varuint16.exists(keyUint42),
            uint42_varuint32: self.uint42_varuint32.exists(keyUint42),
            uint42_bool: self.uint42_bool.exists(keyUint42),
            uint42_cell: self.uint42_cell.exists(keyUint42),
            uint42_address: self.uint42_address.exists(keyUint42),
            uint42_struct: self.uint42_struct.exists(keyUint42),

            uint256_varint16: self.uint256_varint16.exists(keyUint256),
            uint256_varint32: self.uint256_varint32.exists(keyUint256),
            uint256_varuint16: self.uint256_varuint16.exists(keyUint256),
            uint256_varuint32: self.uint256_varuint32.exists(keyUint256),
            uint256_bool: self.uint256_bool.exists(keyUint256),
            uint256_cell: self.uint256_cell.exists(keyUint256),
            uint256_address: self.uint256_address.exists(keyUint256),
            uint256_struct: self.uint256_struct.exists(keyUint256),

            // Address Key Maps
            address_varint16: self.address_varint16.exists(keyAddress),
            address_varint32: self.address_varint32.exists(keyAddress),
            address_varuint16: self.address_varuint16.exists(keyAddress),
            address_varuint32: self.address_varuint32.exists(keyAddress),
            address_bool: self.address_bool.exists(keyAddress),
            address_cell: self.address_cell.exists(keyAddress),
            address_address: self.address_address.exists(keyAddress),
            address_struct: self.address_struct.exists(keyAddress)
        };
    }

    get fun isEmptyAllMaps(): IsEmptyAllMapsResult {
        return IsEmptyAllMapsResult {
            // Integer Key Maps
            int_varint16: self.int_varint16.isEmpty(),
            int_varint32: self.int_varint32.isEmpty(),
            int_varuint16: self.int_varuint16.isEmpty(),
            int_varuint32: self.int_varuint32.isEmpty(),
            int_bool: self.int_bool.isEmpty(),
            int_cell: self.int_cell.isEmpty(),
            int_address: self.int_address.isEmpty(),
            int_struct: self.int_struct.isEmpty(),

            int8_varint16: self.int8_varint16.isEmpty(),
            int8_varint32: self.int8_varint32.isEmpty(),
            int8_varuint16: self.int8_varuint16.isEmpty(),
            int8_varuint32: self.int8_varuint32.isEmpty(),
            int8_bool: self.int8_bool.isEmpty(),
            int8_cell: self.int8_cell.isEmpty(),
            int8_address: self.int8_address.isEmpty(),
            int8_struct: self.int8_struct.isEmpty(),

            int42_varint16: self.int42_varint16.isEmpty(),
            int42_varint32: self.int42_varint32.isEmpty(),
            int42_varuint16: self.int42_varuint16.isEmpty(),
            int42_varuint32: self.int42_varuint32.isEmpty(),
            int42_bool: self.int42_bool.isEmpty(),
            int42_cell: self.int42_cell.isEmpty(),
            int42_address: self.int42_address.isEmpty(),
            int42_struct: self.int42_struct.isEmpty(),

            int256_varint16: self.int256_varint16.isEmpty(),
            int256_varint32: self.int256_varint32.isEmpty(),
            int256_varuint16: self.int256_varuint16.isEmpty(),
            int256_varuint32: self.int256_varuint32.isEmpty(),
            int256_bool: self.int256_bool.isEmpty(),
            int256_cell: self.int256_cell.isEmpty(),
            int256_address: self.int256_address.isEmpty(),
            int256_struct: self.int256_struct.isEmpty(),

            uint8_varint16: self.uint8_varint16.isEmpty(),
            uint8_varint32: self.uint8_varint32.isEmpty(),
            uint8_varuint16: self.uint8_varuint16.isEmpty(),
            uint8_varuint32: self.uint8_varuint32.isEmpty(),
            uint8_bool: self.uint8_bool.isEmpty(),
            uint8_cell: self.uint8_cell.isEmpty(),
            uint8_address: self.uint8_address.isEmpty(),
            uint8_struct: self.uint8_struct.isEmpty(),

            uint42_varint16: self.uint42_varint16.isEmpty(),
            uint42_varint32: self.uint42_varint32.isEmpty(),
            uint42_varuint16: self.uint42_varuint16.isEmpty(),
            uint42_varuint32: self.uint42_varuint32.isEmpty(),
            uint42_bool: self.uint42_bool.isEmpty(),
            uint42_cell: self.uint42_cell.isEmpty(),
            uint42_address: self.uint42_address.isEmpty(),
            uint42_struct: self.uint42_struct.isEmpty(),

            uint256_varint16: self.uint256_varint16.isEmpty(),
            uint256_varint32: self.uint256_varint32.isEmpty(),
            uint256_varuint16: self.uint256_varuint16.isEmpty(),
            uint256_varuint32: self.uint256_varuint32.isEmpty(),
            uint256_bool: self.uint256_bool.isEmpty(),
            uint256_cell: self.uint256_cell.isEmpty(),
            uint256_address: self.uint256_address.isEmpty(),
            uint256_struct: self.uint256_struct.isEmpty(),

            // Address Key Maps
            address_varint16: self.address_varint16.isEmpty(),
            address_varint32: self.address_varint32.isEmpty(),
            address_varuint16: self.address_varuint16.isEmpty(),
            address_varuint32: self.address_varuint32.isEmpty(),
            address_bool: self.address_bool.isEmpty(),
            address_cell: self.address_cell.isEmpty(),
            address_address: self.address_address.isEmpty(),
            address_struct: self.address_struct.isEmpty()
        };
    }

    get fun asCellAllMaps(): AsCellAllMapsResult {
        return AsCellAllMapsResult {
            // Integer Key Maps
            int_varint16: self.int_varint16.asCell(),
            int_varint32: self.int_varint32.asCell(),
            int_varuint16: self.int_varuint16.asCell(),
            int_varuint32: self.int_varuint32.asCell(),
            int_bool: self.int_bool.asCell(),
            int_cell: self.int_cell.asCell(),
            int_address: self.int_address.asCell(),
            int_struct: self.int_struct.asCell(),

            int8_varint16: self.int8_varint16.asCell(),
            int8_varint32: self.int8_varint32.asCell(),
            int8_varuint16: self.int8_varuint16.asCell(),
            int8_varuint32: self.int8_varuint32.asCell(),
            int8_bool: self.int8_bool.asCell(),
            int8_cell: self.int8_cell.asCell(),
            int8_address: self.int8_address.asCell(),
            int8_struct: self.int8_struct.asCell(),

            int42_varint16: self.int42_varint16.asCell(),
            int42_varint32: self.int42_varint32.asCell(),
            int42_varuint16: self.int42_varuint16.asCell(),
            int42_varuint32: self.int42_varuint32.asCell(),
            int42_bool: self.int42_bool.asCell(),
            int42_cell: self.int42_cell.asCell(),
            int42_address: self.int42_address.asCell(),
            int42_struct: self.int42_struct.asCell(),

            int256_varint16: self.int256_varint16.asCell(),
            int256_varint32: self.int256_varint32.asCell(),
            int256_varuint16: self.int256_varuint16.asCell(),
            int256_varuint32: self.int256_varuint32.asCell(),
            int256_bool: self.int256_bool.asCell(),
            int256_cell: self.int256_cell.asCell(),
            int256_address: self.int256_address.asCell(),
            int256_struct: self.int256_struct.asCell(),

            uint8_varint16: self.uint8_varint16.asCell(),
            uint8_varint32: self.uint8_varint32.asCell(),
            uint8_varuint16: self.uint8_varuint16.asCell(),
            uint8_varuint32: self.uint8_varuint32.asCell(),
            uint8_bool: self.uint8_bool.asCell(),
            uint8_cell: self.uint8_cell.asCell(),
            uint8_address: self.uint8_address.asCell(),
            uint8_struct: self.uint8_struct.asCell(),

            uint42_varint16: self.uint42_varint16.asCell(),
            uint42_varint32: self.uint42_varint32.asCell(),
            uint42_varuint16: self.uint42_varuint16.asCell(),
            uint42_varuint32: self.uint42_varuint32.asCell(),
            uint42_bool: self.uint42_bool.asCell(),
            uint42_cell: self.uint42_cell.asCell(),
            uint42_address: self.uint42_address.asCell(),
            uint42_struct: self.uint42_struct.asCell(),

            uint256_varint16: self.uint256_varint16.asCell(),
            uint256_varint32: self.uint256_varint32.asCell(),
            uint256_varuint16: self.uint256_varuint16.asCell(),
            uint256_varuint32: self.uint256_varuint32.asCell(),
            uint256_bool: self.uint256_bool.asCell(),
            uint256_cell: self.uint256_cell.asCell(),
            uint256_address: self.uint256_address.asCell(),
            uint256_struct: self.uint256_struct.asCell(),

            // Address Key Maps
            address_varint16: self.address_varint16.asCell(),
            address_varint32: self.address_varint32.asCell(),
            address_varuint16: self.address_varuint16.asCell(),
            address_varuint32: self.address_varuint32.asCell(),
            address_bool: self.address_bool.asCell(),
            address_cell: self.address_cell.asCell(),
            address_address: self.address_address.asCell(),
            address_struct: self.address_struct.asCell()
        };
    }

    //
    // Edge Cases
    //

    get fun checkNullReference(): Int {
        let m: map<Int, Int> = emptyMap();
        return m.get(0)!!;
    }

    receive(msg: CheckNullReference) {
        let m: map<Int, Int> = emptyMap();
        m.get(0)!!;
    }
}
