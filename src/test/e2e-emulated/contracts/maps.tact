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
    int_int: Int?;
    int_int8: Int?;
    int_int42: Int?;
    int_int256: Int?;
    int_uint8: Int?;
    int_uint42: Int?;
    int_uint256: Int?;
    int_coins: Int?;
    int_bool: Bool?;
    int_cell: Cell?;
    int_address: Address?;
    int_struct: SomeStruct?;

    int8_int: Int?;
    int8_int8: Int?;
    int8_int42: Int?;
    int8_int256: Int?;
    int8_uint8: Int?;
    int8_uint42: Int?;
    int8_uint256: Int?;
    int8_coins: Int?;
    int8_bool: Bool?;
    int8_cell: Cell?;
    int8_address: Address?;
    int8_struct: SomeStruct?;

    int42_int: Int?;
    int42_int8: Int?;
    int42_int42: Int?;
    int42_int256: Int?;
    int42_uint8: Int?;
    int42_uint42: Int?;
    int42_uint256: Int?;
    int42_coins: Int?;
    int42_bool: Bool?;
    int42_cell: Cell?;
    int42_address: Address?;
    int42_struct: SomeStruct?;

    int256_int: Int?;
    int256_int8: Int?;
    int256_int42: Int?;
    int256_int256: Int?;
    int256_uint8: Int?;
    int256_uint42: Int?;
    int256_uint256: Int?;
    int256_coins: Int?;
    int256_bool: Bool?;
    int256_cell: Cell?;
    int256_address: Address?;
    int256_struct: SomeStruct?;

    uint8_int: Int?;
    uint8_int8: Int?;
    uint8_int42: Int?;
    uint8_int256: Int?;
    uint8_uint8: Int?;
    uint8_uint42: Int?;
    uint8_uint256: Int?;
    uint8_coins: Int?;
    uint8_bool: Bool?;
    uint8_cell: Cell?;
    uint8_address: Address?;
    uint8_struct: SomeStruct?;

    uint42_int: Int?;
    uint42_int8: Int?;
    uint42_int42: Int?;
    uint42_int256: Int?;
    uint42_uint8: Int?;
    uint42_uint42: Int?;
    uint42_uint256: Int?;
    uint42_coins: Int?;
    uint42_bool: Bool?;
    uint42_cell: Cell?;
    uint42_address: Address?;
    uint42_struct: SomeStruct?;

    uint256_int: Int?;
    uint256_int8: Int?;
    uint256_int42: Int?;
    uint256_int256: Int?;
    uint256_uint8: Int?;
    uint256_uint42: Int?;
    uint256_uint256: Int?;
    uint256_coins: Int?;
    uint256_bool: Bool?;
    uint256_cell: Cell?;
    uint256_address: Address?;
    uint256_struct: SomeStruct?;

    // Address Key Maps
    address_int: Int?;
    address_int8: Int?;
    address_int42: Int?;
    address_int256: Int?;
    address_uint8: Int?;
    address_uint42: Int?;
    address_uint256: Int?;
    address_coins: Int?;
    address_bool: Bool?;
    address_cell: Cell?;
    address_address: Address?;
    address_struct: SomeStruct?;
}

struct ReplaceAllMapsResult {
    // Integer Key Maps
    int_int: Bool;
    int_int8: Bool;
    int_int42: Bool;
    int_int256: Bool;
    int_uint8: Bool;
    int_uint42: Bool;
    int_uint256: Bool;
    int_coins: Bool;
    int_bool: Bool;
    int_cell: Bool;
    int_address: Bool;
    int_struct: Bool;

    int8_int: Bool;
    int8_int8: Bool;
    int8_int42: Bool;
    int8_int256: Bool;
    int8_uint8: Bool;
    int8_uint42: Bool;
    int8_uint256: Bool;
    int8_coins: Bool;
    int8_bool: Bool;
    int8_cell: Bool;
    int8_address: Bool;
    int8_struct: Bool;

    int42_int: Bool;
    int42_int8: Bool;
    int42_int42: Bool;
    int42_int256: Bool;
    int42_uint8: Bool;
    int42_uint42: Bool;
    int42_uint256: Bool;
    int42_coins: Bool;
    int42_bool: Bool;
    int42_cell: Bool;
    int42_address: Bool;
    int42_struct: Bool;

    int256_int: Bool;
    int256_int8: Bool;
    int256_int42: Bool;
    int256_int256: Bool;
    int256_uint8: Bool;
    int256_uint42: Bool;
    int256_uint256: Bool;
    int256_coins: Bool;
    int256_bool: Bool;
    int256_cell: Bool;
    int256_address: Bool;
    int256_struct: Bool;

    uint8_int: Bool;
    uint8_int8: Bool;
    uint8_int42: Bool;
    uint8_int256: Bool;
    uint8_uint8: Bool;
    uint8_uint42: Bool;
    uint8_uint256: Bool;
    uint8_coins: Bool;
    uint8_bool: Bool;
    uint8_cell: Bool;
    uint8_address: Bool;
    uint8_struct: Bool;

    uint42_int: Bool;
    uint42_int8: Bool;
    uint42_int42: Bool;
    uint42_int256: Bool;
    uint42_uint8: Bool;
    uint42_uint42: Bool;
    uint42_uint256: Bool;
    uint42_coins: Bool;
    uint42_bool: Bool;
    uint42_cell: Bool;
    uint42_address: Bool;
    uint42_struct: Bool;

    uint256_int: Bool;
    uint256_int8: Bool;
    uint256_int42: Bool;
    uint256_int256: Bool;
    uint256_uint8: Bool;
    uint256_uint42: Bool;
    uint256_uint256: Bool;
    uint256_coins: Bool;
    uint256_bool: Bool;
    uint256_cell: Bool;
    uint256_address: Bool;
    uint256_struct: Bool;

    // Address Key Maps
    address_int: Bool;
    address_int8: Bool;
    address_int42: Bool;
    address_int256: Bool;
    address_uint8: Bool;
    address_uint42: Bool;
    address_uint256: Bool;
    address_coins: Bool;
    address_bool: Bool;
    address_cell: Bool;
    address_address: Bool;
    address_struct: Bool;
}

struct ReplaceGetAllMapsResult {
    // Integer Key Maps
    int_int: Int?;
    int_int8: Int?;
    int_int42: Int?;
    int_int256: Int?;
    int_uint8: Int?;
    int_uint42: Int?;
    int_uint256: Int?;
    int_coins: Int?;
    int_bool: Bool?;
    int_cell: Cell?;
    int_address: Address?;
    int_struct: SomeStruct?;

    int8_int: Int?;
    int8_int8: Int?;
    int8_int42: Int?;
    int8_int256: Int?;
    int8_uint8: Int?;
    int8_uint42: Int?;
    int8_uint256: Int?;
    int8_coins: Int?;
    int8_bool: Bool?;
    int8_cell: Cell?;
    int8_address: Address?;
    int8_struct: SomeStruct?;

    int42_int: Int?;
    int42_int8: Int?;
    int42_int42: Int?;
    int42_int256: Int?;
    int42_uint8: Int?;
    int42_uint42: Int?;
    int42_uint256: Int?;
    int42_coins: Int?;
    int42_bool: Bool?;
    int42_cell: Cell?;
    int42_address: Address?;
    int42_struct: SomeStruct?;

    int256_int: Int?;
    int256_int8: Int?;
    int256_int42: Int?;
    int256_int256: Int?;
    int256_uint8: Int?;
    int256_uint42: Int?;
    int256_uint256: Int?;
    int256_coins: Int?;
    int256_bool: Bool?;
    int256_cell: Cell?;
    int256_address: Address?;
    int256_struct: SomeStruct?;

    uint8_int: Int?;
    uint8_int8: Int?;
    uint8_int42: Int?;
    uint8_int256: Int?;
    uint8_uint8: Int?;
    uint8_uint42: Int?;
    uint8_uint256: Int?;
    uint8_coins: Int?;
    uint8_bool: Bool?;
    uint8_cell: Cell?;
    uint8_address: Address?;
    uint8_struct: SomeStruct?;

    uint42_int: Int?;
    uint42_int8: Int?;
    uint42_int42: Int?;
    uint42_int256: Int?;
    uint42_uint8: Int?;
    uint42_uint42: Int?;
    uint42_uint256: Int?;
    uint42_coins: Int?;
    uint42_bool: Bool?;
    uint42_cell: Cell?;
    uint42_address: Address?;
    uint42_struct: SomeStruct?;

    uint256_int: Int?;
    uint256_int8: Int?;
    uint256_int42: Int?;
    uint256_int256: Int?;
    uint256_uint8: Int?;
    uint256_uint42: Int?;
    uint256_uint256: Int?;
    uint256_coins: Int?;
    uint256_bool: Bool?;
    uint256_cell: Cell?;
    uint256_address: Address?;
    uint256_struct: SomeStruct?;

    // Address Key Maps
    address_int: Int?;
    address_int8: Int?;
    address_int42: Int?;
    address_int256: Int?;
    address_uint8: Int?;
    address_uint42: Int?;
    address_uint256: Int?;
    address_coins: Int?;
    address_bool: Bool?;
    address_cell: Cell?;
    address_address: Address?;
    address_struct: SomeStruct?;
}

struct ExistsAllMapsResult {
    // Integer Key Maps
    int_int: Bool;
    int_int8: Bool;
    int_int42: Bool;
    int_int256: Bool;
    int_uint8: Bool;
    int_uint42: Bool;
    int_uint256: Bool;
    int_coins: Bool;
    int_bool: Bool;
    int_cell: Bool;
    int_address: Bool;
    int_struct: Bool;

    int8_int: Bool;
    int8_int8: Bool;
    int8_int42: Bool;
    int8_int256: Bool;
    int8_uint8: Bool;
    int8_uint42: Bool;
    int8_uint256: Bool;
    int8_coins: Bool;
    int8_bool: Bool;
    int8_cell: Bool;
    int8_address: Bool;
    int8_struct: Bool;

    int42_int: Bool;
    int42_int8: Bool;
    int42_int42: Bool;
    int42_int256: Bool;
    int42_uint8: Bool;
    int42_uint42: Bool;
    int42_uint256: Bool;
    int42_coins: Bool;
    int42_bool: Bool;
    int42_cell: Bool;
    int42_address: Bool;
    int42_struct: Bool;

    int256_int: Bool;
    int256_int8: Bool;
    int256_int42: Bool;
    int256_int256: Bool;
    int256_uint8: Bool;
    int256_uint42: Bool;
    int256_uint256: Bool;
    int256_coins: Bool;
    int256_bool: Bool;
    int256_cell: Bool;
    int256_address: Bool;
    int256_struct: Bool;

    uint8_int: Bool;
    uint8_int8: Bool;
    uint8_int42: Bool;
    uint8_int256: Bool;
    uint8_uint8: Bool;
    uint8_uint42: Bool;
    uint8_uint256: Bool;
    uint8_coins: Bool;
    uint8_bool: Bool;
    uint8_cell: Bool;
    uint8_address: Bool;
    uint8_struct: Bool;

    uint42_int: Bool;
    uint42_int8: Bool;
    uint42_int42: Bool;
    uint42_int256: Bool;
    uint42_uint8: Bool;
    uint42_uint42: Bool;
    uint42_uint256: Bool;
    uint42_coins: Bool;
    uint42_bool: Bool;
    uint42_cell: Bool;
    uint42_address: Bool;
    uint42_struct: Bool;

    uint256_int: Bool;
    uint256_int8: Bool;
    uint256_int42: Bool;
    uint256_int256: Bool;
    uint256_uint8: Bool;
    uint256_uint42: Bool;
    uint256_uint256: Bool;
    uint256_coins: Bool;
    uint256_bool: Bool;
    uint256_cell: Bool;
    uint256_address: Bool;
    uint256_struct: Bool;

    // Address Key Maps
    address_int: Bool;
    address_int8: Bool;
    address_int42: Bool;
    address_int256: Bool;
    address_uint8: Bool;
    address_uint42: Bool;
    address_uint256: Bool;
    address_coins: Bool;
    address_bool: Bool;
    address_cell: Bool;
    address_address: Bool;
    address_struct: Bool;
}

struct IsEmptyAllMapsResult {
    // Integer Key Maps
    int_int: Bool;
    int_int8: Bool;
    int_int42: Bool;
    int_int256: Bool;
    int_uint8: Bool;
    int_uint42: Bool;
    int_uint256: Bool;
    int_coins: Bool;
    int_bool: Bool;
    int_cell: Bool;
    int_address: Bool;
    int_struct: Bool;

    int8_int: Bool;
    int8_int8: Bool;
    int8_int42: Bool;
    int8_int256: Bool;
    int8_uint8: Bool;
    int8_uint42: Bool;
    int8_uint256: Bool;
    int8_coins: Bool;
    int8_bool: Bool;
    int8_cell: Bool;
    int8_address: Bool;
    int8_struct: Bool;

    int42_int: Bool;
    int42_int8: Bool;
    int42_int42: Bool;
    int42_int256: Bool;
    int42_uint8: Bool;
    int42_uint42: Bool;
    int42_uint256: Bool;
    int42_coins: Bool;
    int42_bool: Bool;
    int42_cell: Bool;
    int42_address: Bool;
    int42_struct: Bool;

    int256_int: Bool;
    int256_int8: Bool;
    int256_int42: Bool;
    int256_int256: Bool;
    int256_uint8: Bool;
    int256_uint42: Bool;
    int256_uint256: Bool;
    int256_coins: Bool;
    int256_bool: Bool;
    int256_cell: Bool;
    int256_address: Bool;
    int256_struct: Bool;

    uint8_int: Bool;
    uint8_int8: Bool;
    uint8_int42: Bool;
    uint8_int256: Bool;
    uint8_uint8: Bool;
    uint8_uint42: Bool;
    uint8_uint256: Bool;
    uint8_coins: Bool;
    uint8_bool: Bool;
    uint8_cell: Bool;
    uint8_address: Bool;
    uint8_struct: Bool;

    uint42_int: Bool;
    uint42_int8: Bool;
    uint42_int42: Bool;
    uint42_int256: Bool;
    uint42_uint8: Bool;
    uint42_uint42: Bool;
    uint42_uint256: Bool;
    uint42_coins: Bool;
    uint42_bool: Bool;
    uint42_cell: Bool;
    uint42_address: Bool;
    uint42_struct: Bool;

    uint256_int: Bool;
    uint256_int8: Bool;
    uint256_int42: Bool;
    uint256_int256: Bool;
    uint256_uint8: Bool;
    uint256_uint42: Bool;
    uint256_uint256: Bool;
    uint256_coins: Bool;
    uint256_bool: Bool;
    uint256_cell: Bool;
    uint256_address: Bool;
    uint256_struct: Bool;

    // Address Key Maps
    address_int: Bool;
    address_int8: Bool;
    address_int42: Bool;
    address_int256: Bool;
    address_uint8: Bool;
    address_uint42: Bool;
    address_uint256: Bool;
    address_coins: Bool;
    address_bool: Bool;
    address_cell: Bool;
    address_address: Bool;
    address_struct: Bool;
}

struct AsCellAllMapsResult {
    // Integer Key Maps
    int_int: Cell?;
    int_int8: Cell?;
    int_int42: Cell?;
    int_int256: Cell?;
    int_uint8: Cell?;
    int_uint42: Cell?;
    int_uint256: Cell?;
    int_coins: Cell?;
    int_bool: Cell?;
    int_cell: Cell?;
    int_address: Cell?;
    int_struct: Cell?;

    int8_int: Cell?;
    int8_int8: Cell?;
    int8_int42: Cell?;
    int8_int256: Cell?;
    int8_uint8: Cell?;
    int8_uint42: Cell?;
    int8_uint256: Cell?;
    int8_coins: Cell?;
    int8_bool: Cell?;
    int8_cell: Cell?;
    int8_address: Cell?;
    int8_struct: Cell?;

    int42_int: Cell?;
    int42_int8: Cell?;
    int42_int42: Cell?;
    int42_int256: Cell?;
    int42_uint8: Cell?;
    int42_uint42: Cell?;
    int42_uint256: Cell?;
    int42_coins: Cell?;
    int42_bool: Cell?;
    int42_cell: Cell?;
    int42_address: Cell?;
    int42_struct: Cell?;

    int256_int: Cell?;
    int256_int8: Cell?;
    int256_int42: Cell?;
    int256_int256: Cell?;
    int256_uint8: Cell?;
    int256_uint42: Cell?;
    int256_uint256: Cell?;
    int256_coins: Cell?;
    int256_bool: Cell?;
    int256_cell: Cell?;
    int256_address: Cell?;
    int256_struct: Cell?;

    uint8_int: Cell?;
    uint8_int8: Cell?;
    uint8_int42: Cell?;
    uint8_int256: Cell?;
    uint8_uint8: Cell?;
    uint8_uint42: Cell?;
    uint8_uint256: Cell?;
    uint8_coins: Cell?;
    uint8_bool: Cell?;
    uint8_cell: Cell?;
    uint8_address: Cell?;
    uint8_struct: Cell?;

    uint42_int: Cell?;
    uint42_int8: Cell?;
    uint42_int42: Cell?;
    uint42_int256: Cell?;
    uint42_uint8: Cell?;
    uint42_uint42: Cell?;
    uint42_uint256: Cell?;
    uint42_coins: Cell?;
    uint42_bool: Cell?;
    uint42_cell: Cell?;
    uint42_address: Cell?;
    uint42_struct: Cell?;

    uint256_int: Cell?;
    uint256_int8: Cell?;
    uint256_int42: Cell?;
    uint256_int256: Cell?;
    uint256_uint8: Cell?;
    uint256_uint42: Cell?;
    uint256_uint256: Cell?;
    uint256_coins: Cell?;
    uint256_bool: Cell?;
    uint256_cell: Cell?;
    uint256_address: Cell?;
    uint256_struct: Cell?;

    // Address Key Maps
    address_int: Cell?;
    address_int8: Cell?;
    address_int42: Cell?;
    address_int256: Cell?;
    address_uint8: Cell?;
    address_uint42: Cell?;
    address_uint256: Cell?;
    address_coins: Cell?;
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
    valueInt: Int?;
    valueInt8: Int?;
    valueInt42: Int?;
    valueInt256: Int?;
    valueUint8: Int?;
    valueUint42: Int?;
    valueUint256: Int?;
    valueCoins: Int?;
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
    valueInt: Int?;
    valueInt8: Int?;
    valueInt42: Int?;
    valueInt256: Int?;
    valueUint8: Int?;
    valueUint42: Int?;
    valueUint256: Int?;
    valueCoins: Int?;
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
    valueInt: Int?;
    valueInt8: Int?;
    valueInt42: Int?;
    valueInt256: Int?;
    valueUint8: Int?;
    valueUint42: Int?;
    valueUint256: Int?;
    valueCoins: Int?;
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

    int_int: map<Int, Int>;
    int_int8: map<Int, Int as int8>;
    int_int42: map<Int, Int as int42>;
    int_int256: map<Int, Int as int256>;
    int_uint8: map<Int, Int as uint8>;
    int_uint42: map<Int, Int as uint42>;
    int_uint256: map<Int, Int as uint256>;
    int_coins: map<Int, Int as coins>;
    int_bool: map<Int, Bool>;
    int_cell: map<Int, Cell>;
    int_address: map<Int, Address>;
    int_struct: map<Int, SomeStruct>;

    // ===============================
    // Integer (`Int as int8`) Key Maps
    // ===============================

    int8_int: map<Int as int8, Int>;
    int8_int8: map<Int as int8, Int as int8>;
    int8_int42: map<Int as int8, Int as int42>;
    int8_int256: map<Int as int8, Int as int256>;
    int8_uint8: map<Int as int8, Int as uint8>;
    int8_uint42: map<Int as int8, Int as uint42>;
    int8_uint256: map<Int as int8, Int as uint256>;
    int8_coins: map<Int as int8, Int as coins>;
    int8_bool: map<Int as int8, Bool>;
    int8_cell: map<Int as int8, Cell>;
    int8_address: map<Int as int8, Address>;
    int8_struct: map<Int as int8, SomeStruct>;

    // ===============================
    // Integer (`Int as int42`) Key Maps
    // ===============================

    int42_int: map<Int as int42, Int>;
    int42_int8: map<Int as int42, Int as int8>;
    int42_int42: map<Int as int42, Int as int42>;
    int42_int256: map<Int as int42, Int as int256>;
    int42_uint8: map<Int as int42, Int as uint8>;
    int42_uint42: map<Int as int42, Int as uint42>;
    int42_uint256: map<Int as int42, Int as uint256>;
    int42_coins: map<Int as int42, Int as coins>;
    int42_bool: map<Int as int42, Bool>;
    int42_cell: map<Int as int42, Cell>;
    int42_address: map<Int as int42, Address>;
    int42_struct: map<Int as int42, SomeStruct>;

    // ===============================
    // Integer (`Int as int256`) Key Maps
    // ===============================

    int256_int: map<Int as int256, Int>;
    int256_int8: map<Int as int256, Int as int8>;
    int256_int42: map<Int as int256, Int as int42>;
    int256_int256: map<Int as int256, Int as int256>;
    int256_uint8: map<Int as int256, Int as uint8>;
    int256_uint42: map<Int as int256, Int as uint42>;
    int256_uint256: map<Int as int256, Int as uint256>;
    int256_coins: map<Int as int256, Int as coins>;
    int256_bool: map<Int as int256, Bool>;
    int256_cell: map<Int as int256, Cell>;
    int256_address: map<Int as int256, Address>;
    int256_struct: map<Int as int256, SomeStruct>;

    // ===============================
    // Unsigned Integer (`Int as uint8`) Key Maps
    // ===============================

    uint8_int: map<Int as uint8, Int>;
    uint8_int8: map<Int as uint8, Int as int8>;
    uint8_int42: map<Int as uint8, Int as int42>;
    uint8_int256: map<Int as uint8, Int as int256>;
    uint8_uint8: map<Int as uint8, Int as uint8>;
    uint8_uint42: map<Int as uint8, Int as uint42>;
    uint8_uint256: map<Int as uint8, Int as uint256>;
    uint8_coins: map<Int as uint8, Int as coins>;
    uint8_bool: map<Int as uint8, Bool>;
    uint8_cell: map<Int as uint8, Cell>;
    uint8_address: map<Int as uint8, Address>;
    uint8_struct: map<Int as uint8, SomeStruct>;

    // ===============================
    // Unsigned Integer (`Int as uint42`) Key Maps
    // ===============================

    uint42_int: map<Int as uint42, Int>;
    uint42_int8: map<Int as uint42, Int as int8>;
    uint42_int42: map<Int as uint42, Int as int42>;
    uint42_int256: map<Int as uint42, Int as int256>;
    uint42_uint8: map<Int as uint42, Int as uint8>;
    uint42_uint42: map<Int as uint42, Int as uint42>;
    uint42_uint256: map<Int as uint42, Int as uint256>;
    uint42_coins: map<Int as uint42, Int as coins>;
    uint42_bool: map<Int as uint42, Bool>;
    uint42_cell: map<Int as uint42, Cell>;
    uint42_address: map<Int as uint42, Address>;
    uint42_struct: map<Int as uint42, SomeStruct>;

    // ===============================
    // Unsigned Integer (`Int as uint256`) Key Maps
    // ===============================

    uint256_int: map<Int as uint256, Int>;
    uint256_int8: map<Int as uint256, Int as int8>;
    uint256_int42: map<Int as uint256, Int as int42>;
    uint256_int256: map<Int as uint256, Int as int256>;
    uint256_uint8: map<Int as uint256, Int as uint8>;
    uint256_uint42: map<Int as uint256, Int as uint42>;
    uint256_uint256: map<Int as uint256, Int as uint256>;
    uint256_coins: map<Int as uint256, Int as coins>;
    uint256_bool: map<Int as uint256, Bool>;
    uint256_cell: map<Int as uint256, Cell>;
    uint256_address: map<Int as uint256, Address>;
    uint256_struct: map<Int as uint256, SomeStruct>;

    // ===============================
    // Address Key Maps
    // ===============================

    address_int: map<Address, Int>;
    address_int8: map<Address, Int as int8>;
    address_int42: map<Address, Int as int42>;
    address_int256: map<Address, Int as int256>;
    address_uint8: map<Address, Int as uint8>;
    address_uint42: map<Address, Int as uint42>;
    address_uint256: map<Address, Int as uint256>;
    address_coins: map<Address, Int as coins>;
    address_bool: map<Address, Bool>;
    address_cell: map<Address, Cell>;
    address_address: map<Address, Address>;
    address_struct: map<Address, SomeStruct>;

    // ===============================
    // Receivers For Operations
    // ===============================

    receive(msg: SetAllMaps) {
        // Integer Key Maps
        self.int_int.set(msg.keyInt, msg.valueInt);
        self.int_int8.set(msg.keyInt, msg.valueInt8);
        self.int_int42.set(msg.keyInt, msg.valueInt42);
        self.int_int256.set(msg.keyInt, msg.valueInt256);
        self.int_uint8.set(msg.keyInt, msg.valueUint8);
        self.int_uint42.set(msg.keyInt, msg.valueUint42);
        self.int_uint256.set(msg.keyInt, msg.valueUint256);
        self.int_coins.set(msg.keyInt, msg.valueCoins);
        self.int_bool.set(msg.keyInt, msg.valueBool);
        self.int_cell.set(msg.keyInt, msg.valueCell);
        self.int_address.set(msg.keyInt, msg.valueAddress);
        self.int_struct.set(msg.keyInt, msg.valueStruct);

        self.int8_int.set(msg.keyInt8, msg.valueInt);
        self.int8_int8.set(msg.keyInt8, msg.valueInt8);
        self.int8_int42.set(msg.keyInt8, msg.valueInt42);
        self.int8_int256.set(msg.keyInt8, msg.valueInt256);
        self.int8_uint8.set(msg.keyInt8, msg.valueUint8);
        self.int8_uint42.set(msg.keyInt8, msg.valueUint42);
        self.int8_uint256.set(msg.keyInt8, msg.valueUint256);
        self.int8_coins.set(msg.keyInt8, msg.valueCoins);
        self.int8_bool.set(msg.keyInt8, msg.valueBool);
        self.int8_cell.set(msg.keyInt8, msg.valueCell);
        self.int8_address.set(msg.keyInt8, msg.valueAddress);
        self.int8_struct.set(msg.keyInt8, msg.valueStruct);

        self.int42_int.set(msg.keyInt42, msg.valueInt);
        self.int42_int8.set(msg.keyInt42, msg.valueInt8);
        self.int42_int42.set(msg.keyInt42, msg.valueInt42);
        self.int42_int256.set(msg.keyInt42, msg.valueInt256);
        self.int42_uint8.set(msg.keyInt42, msg.valueUint8);
        self.int42_uint42.set(msg.keyInt42, msg.valueUint42);
        self.int42_uint256.set(msg.keyInt42, msg.valueUint256);
        self.int42_coins.set(msg.keyInt42, msg.valueCoins);
        self.int42_bool.set(msg.keyInt42, msg.valueBool);
        self.int42_cell.set(msg.keyInt42, msg.valueCell);
        self.int42_address.set(msg.keyInt42, msg.valueAddress);
        self.int42_struct.set(msg.keyInt42, msg.valueStruct);

        self.int256_int.set(msg.keyInt256, msg.valueInt);
        self.int256_int8.set(msg.keyInt256, msg.valueInt8);
        self.int256_int42.set(msg.keyInt256, msg.valueInt42);
        self.int256_int256.set(msg.keyInt256, msg.valueInt256);
        self.int256_uint8.set(msg.keyInt256, msg.valueUint8);
        self.int256_uint42.set(msg.keyInt256, msg.valueUint42);
        self.int256_uint256.set(msg.keyInt256, msg.valueUint256);
        self.int256_coins.set(msg.keyInt256, msg.valueCoins);
        self.int256_bool.set(msg.keyInt256, msg.valueBool);
        self.int256_cell.set(msg.keyInt256, msg.valueCell);
        self.int256_address.set(msg.keyInt256, msg.valueAddress);
        self.int256_struct.set(msg.keyInt256, msg.valueStruct);

        self.uint8_int.set(msg.keyUint8, msg.valueInt);
        self.uint8_int8.set(msg.keyUint8, msg.valueInt8);
        self.uint8_int42.set(msg.keyUint8, msg.valueInt42);
        self.uint8_int256.set(msg.keyUint8, msg.valueInt256);
        self.uint8_uint8.set(msg.keyUint8, msg.valueUint8);
        self.uint8_uint42.set(msg.keyUint8, msg.valueUint42);
        self.uint8_uint256.set(msg.keyUint8, msg.valueUint256);
        self.uint8_coins.set(msg.keyUint8, msg.valueCoins);
        self.uint8_bool.set(msg.keyUint8, msg.valueBool);
        self.uint8_cell.set(msg.keyUint8, msg.valueCell);
        self.uint8_address.set(msg.keyUint8, msg.valueAddress);
        self.uint8_struct.set(msg.keyUint8, msg.valueStruct);

        self.uint42_int.set(msg.keyUint42, msg.valueInt);
        self.uint42_int8.set(msg.keyUint42, msg.valueInt8);
        self.uint42_int42.set(msg.keyUint42, msg.valueInt42);
        self.uint42_int256.set(msg.keyUint42, msg.valueInt256);
        self.uint42_uint8.set(msg.keyUint42, msg.valueUint8);
        self.uint42_uint42.set(msg.keyUint42, msg.valueUint42);
        self.uint42_uint256.set(msg.keyUint42, msg.valueUint256);
        self.uint42_coins.set(msg.keyUint42, msg.valueCoins);
        self.uint42_bool.set(msg.keyUint42, msg.valueBool);
        self.uint42_cell.set(msg.keyUint42, msg.valueCell);
        self.uint42_address.set(msg.keyUint42, msg.valueAddress);
        self.uint42_struct.set(msg.keyUint42, msg.valueStruct);

        self.uint256_int.set(msg.keyUint256, msg.valueInt);
        self.uint256_int8.set(msg.keyUint256, msg.valueInt8);
        self.uint256_int42.set(msg.keyUint256, msg.valueInt42);
        self.uint256_int256.set(msg.keyUint256, msg.valueInt256);
        self.uint256_uint8.set(msg.keyUint256, msg.valueUint8);
        self.uint256_uint42.set(msg.keyUint256, msg.valueUint42);
        self.uint256_uint256.set(msg.keyUint256, msg.valueUint256);
        self.uint256_coins.set(msg.keyUint256, msg.valueCoins);
        self.uint256_bool.set(msg.keyUint256, msg.valueBool);
        self.uint256_cell.set(msg.keyUint256, msg.valueCell);
        self.uint256_address.set(msg.keyUint256, msg.valueAddress);
        self.uint256_struct.set(msg.keyUint256, msg.valueStruct);

        // Address Key Maps
        self.address_int.set(msg.keyAddress, msg.valueInt);
        self.address_int8.set(msg.keyAddress, msg.valueInt8);
        self.address_int42.set(msg.keyAddress, msg.valueInt42);
        self.address_int256.set(msg.keyAddress, msg.valueInt256);
        self.address_uint8.set(msg.keyAddress, msg.valueUint8);
        self.address_uint42.set(msg.keyAddress, msg.valueUint42);
        self.address_uint256.set(msg.keyAddress, msg.valueUint256);
        self.address_coins.set(msg.keyAddress, msg.valueCoins);
        self.address_bool.set(msg.keyAddress, msg.valueBool);
        self.address_cell.set(msg.keyAddress, msg.valueCell);
        self.address_address.set(msg.keyAddress, msg.valueAddress);
        self.address_struct.set(msg.keyAddress, msg.valueStruct);
    }

    receive(msg: DelAllMaps) {
        // Integer Key Maps
        self.int_int.del(msg.keyInt);
        self.int_int8.del(msg.keyInt);
        self.int_int42.del(msg.keyInt);
        self.int_int256.del(msg.keyInt);
        self.int_uint8.del(msg.keyInt);
        self.int_uint42.del(msg.keyInt);
        self.int_uint256.del(msg.keyInt);
        self.int_coins.del(msg.keyInt);
        self.int_bool.del(msg.keyInt);
        self.int_cell.del(msg.keyInt);
        self.int_address.del(msg.keyInt);
        self.int_struct.del(msg.keyInt);

        self.int8_int.del(msg.keyInt8);
        self.int8_int8.del(msg.keyInt8);
        self.int8_int42.del(msg.keyInt8);
        self.int8_int256.del(msg.keyInt8);
        self.int8_uint8.del(msg.keyInt8);
        self.int8_uint42.del(msg.keyInt8);
        self.int8_uint256.del(msg.keyInt8);
        self.int8_coins.del(msg.keyInt8);
        self.int8_bool.del(msg.keyInt8);
        self.int8_cell.del(msg.keyInt8);
        self.int8_address.del(msg.keyInt8);
        self.int8_struct.del(msg.keyInt8);

        self.int42_int.del(msg.keyInt42);
        self.int42_int8.del(msg.keyInt42);
        self.int42_int42.del(msg.keyInt42);
        self.int42_int256.del(msg.keyInt42);
        self.int42_uint8.del(msg.keyInt42);
        self.int42_uint42.del(msg.keyInt42);
        self.int42_uint256.del(msg.keyInt42);
        self.int42_coins.del(msg.keyInt42);
        self.int42_bool.del(msg.keyInt42);
        self.int42_cell.del(msg.keyInt42);
        self.int42_address.del(msg.keyInt42);
        self.int42_struct.del(msg.keyInt42);

        self.int256_int.del(msg.keyInt256);
        self.int256_int8.del(msg.keyInt256);
        self.int256_int42.del(msg.keyInt256);
        self.int256_int256.del(msg.keyInt256);
        self.int256_uint8.del(msg.keyInt256);
        self.int256_uint42.del(msg.keyInt256);
        self.int256_uint256.del(msg.keyInt256);
        self.int256_coins.del(msg.keyInt256);
        self.int256_bool.del(msg.keyInt256);
        self.int256_cell.del(msg.keyInt256);
        self.int256_address.del(msg.keyInt256);
        self.int256_struct.del(msg.keyInt256);

        self.uint8_int.del(msg.keyUint8);
        self.uint8_int8.del(msg.keyUint8);
        self.uint8_int42.del(msg.keyUint8);
        self.uint8_int256.del(msg.keyUint8);
        self.uint8_uint8.del(msg.keyUint8);
        self.uint8_uint42.del(msg.keyUint8);
        self.uint8_uint256.del(msg.keyUint8);
        self.uint8_coins.del(msg.keyUint8);
        self.uint8_bool.del(msg.keyUint8);
        self.uint8_cell.del(msg.keyUint8);
        self.uint8_address.del(msg.keyUint8);
        self.uint8_struct.del(msg.keyUint8);

        self.uint42_int.del(msg.keyUint42);
        self.uint42_int8.del(msg.keyUint42);
        self.uint42_int42.del(msg.keyUint42);
        self.uint42_int256.del(msg.keyUint42);
        self.uint42_uint8.del(msg.keyUint42);
        self.uint42_uint42.del(msg.keyUint42);
        self.uint42_uint256.del(msg.keyUint42);
        self.uint42_coins.del(msg.keyUint42);
        self.uint42_bool.del(msg.keyUint42);
        self.uint42_cell.del(msg.keyUint42);
        self.uint42_address.del(msg.keyUint42);
        self.uint42_struct.del(msg.keyUint42);

        self.uint256_int.del(msg.keyUint256);
        self.uint256_int8.del(msg.keyUint256);
        self.uint256_int42.del(msg.keyUint256);
        self.uint256_int256.del(msg.keyUint256);
        self.uint256_uint8.del(msg.keyUint256);
        self.uint256_uint42.del(msg.keyUint256);
        self.uint256_uint256.del(msg.keyUint256);
        self.uint256_coins.del(msg.keyUint256);
        self.uint256_bool.del(msg.keyUint256);
        self.uint256_cell.del(msg.keyUint256);
        self.uint256_address.del(msg.keyUint256);
        self.uint256_struct.del(msg.keyUint256);

        // Address Key Maps
        self.address_int.del(msg.keyAddress);
        self.address_int8.del(msg.keyAddress);
        self.address_int42.del(msg.keyAddress);
        self.address_int256.del(msg.keyAddress);
        self.address_uint8.del(msg.keyAddress);
        self.address_uint42.del(msg.keyAddress);
        self.address_uint256.del(msg.keyAddress);
        self.address_coins.del(msg.keyAddress);
        self.address_bool.del(msg.keyAddress);
        self.address_cell.del(msg.keyAddress);
        self.address_address.del(msg.keyAddress);
        self.address_struct.del(msg.keyAddress);
    }

    receive(msg: ReplaceAllMaps) {
        // Integer Key Maps
        self.int_int.replace(msg.keyInt, msg.valueInt);
        self.int_int8.replace(msg.keyInt, msg.valueInt8);
        self.int_int42.replace(msg.keyInt, msg.valueInt42);
        self.int_int256.replace(msg.keyInt, msg.valueInt256);
        self.int_uint8.replace(msg.keyInt, msg.valueUint8);
        self.int_uint42.replace(msg.keyInt, msg.valueUint42);
        self.int_uint256.replace(msg.keyInt, msg.valueUint256);
        self.int_coins.replace(msg.keyInt, msg.valueCoins);
        self.int_bool.replace(msg.keyInt, msg.valueBool);
        self.int_cell.replace(msg.keyInt, msg.valueCell);
        self.int_address.replace(msg.keyInt, msg.valueAddress);
        self.int_struct.replace(msg.keyInt, msg.valueStruct);

        self.int8_int.replace(msg.keyInt8, msg.valueInt);
        self.int8_int8.replace(msg.keyInt8, msg.valueInt8);
        self.int8_int42.replace(msg.keyInt8, msg.valueInt42);
        self.int8_int256.replace(msg.keyInt8, msg.valueInt256);
        self.int8_uint8.replace(msg.keyInt8, msg.valueUint8);
        self.int8_uint42.replace(msg.keyInt8, msg.valueUint42);
        self.int8_uint256.replace(msg.keyInt8, msg.valueUint256);
        self.int8_coins.replace(msg.keyInt8, msg.valueCoins);
        self.int8_bool.replace(msg.keyInt8, msg.valueBool);
        self.int8_cell.replace(msg.keyInt8, msg.valueCell);
        self.int8_address.replace(msg.keyInt8, msg.valueAddress);
        self.int8_struct.replace(msg.keyInt8, msg.valueStruct);

        self.int42_int.replace(msg.keyInt42, msg.valueInt);
        self.int42_int8.replace(msg.keyInt42, msg.valueInt8);
        self.int42_int42.replace(msg.keyInt42, msg.valueInt42);
        self.int42_int256.replace(msg.keyInt42, msg.valueInt256);
        self.int42_uint8.replace(msg.keyInt42, msg.valueUint8);
        self.int42_uint42.replace(msg.keyInt42, msg.valueUint42);
        self.int42_uint256.replace(msg.keyInt42, msg.valueUint256);
        self.int42_coins.replace(msg.keyInt42, msg.valueCoins);
        self.int42_bool.replace(msg.keyInt42, msg.valueBool);
        self.int42_cell.replace(msg.keyInt42, msg.valueCell);
        self.int42_address.replace(msg.keyInt42, msg.valueAddress);
        self.int42_struct.replace(msg.keyInt42, msg.valueStruct);

        self.int256_int.replace(msg.keyInt256, msg.valueInt);
        self.int256_int8.replace(msg.keyInt256, msg.valueInt8);
        self.int256_int42.replace(msg.keyInt256, msg.valueInt42);
        self.int256_int256.replace(msg.keyInt256, msg.valueInt256);
        self.int256_uint8.replace(msg.keyInt256, msg.valueUint8);
        self.int256_uint42.replace(msg.keyInt256, msg.valueUint42);
        self.int256_uint256.replace(msg.keyInt256, msg.valueUint256);
        self.int256_coins.replace(msg.keyInt256, msg.valueCoins);
        self.int256_bool.replace(msg.keyInt256, msg.valueBool);
        self.int256_cell.replace(msg.keyInt256, msg.valueCell);
        self.int256_address.replace(msg.keyInt256, msg.valueAddress);
        self.int256_struct.replace(msg.keyInt256, msg.valueStruct);

        self.uint8_int.replace(msg.keyUint8, msg.valueInt);
        self.uint8_int8.replace(msg.keyUint8, msg.valueInt8);
        self.uint8_int42.replace(msg.keyUint8, msg.valueInt42);
        self.uint8_int256.replace(msg.keyUint8, msg.valueInt256);
        self.uint8_uint8.replace(msg.keyUint8, msg.valueUint8);
        self.uint8_uint42.replace(msg.keyUint8, msg.valueUint42);
        self.uint8_uint256.replace(msg.keyUint8, msg.valueUint256);
        self.uint8_coins.replace(msg.keyUint8, msg.valueCoins);
        self.uint8_bool.replace(msg.keyUint8, msg.valueBool);
        self.uint8_cell.replace(msg.keyUint8, msg.valueCell);
        self.uint8_address.replace(msg.keyUint8, msg.valueAddress);
        self.uint8_struct.replace(msg.keyUint8, msg.valueStruct);

        self.uint42_int.replace(msg.keyUint42, msg.valueInt);
        self.uint42_int8.replace(msg.keyUint42, msg.valueInt8);
        self.uint42_int42.replace(msg.keyUint42, msg.valueInt42);
        self.uint42_int256.replace(msg.keyUint42, msg.valueInt256);
        self.uint42_uint8.replace(msg.keyUint42, msg.valueUint8);
        self.uint42_uint42.replace(msg.keyUint42, msg.valueUint42);
        self.uint42_uint256.replace(msg.keyUint42, msg.valueUint256);
        self.uint42_coins.replace(msg.keyUint42, msg.valueCoins);
        self.uint42_bool.replace(msg.keyUint42, msg.valueBool);
        self.uint42_cell.replace(msg.keyUint42, msg.valueCell);
        self.uint42_address.replace(msg.keyUint42, msg.valueAddress);
        self.uint42_struct.replace(msg.keyUint42, msg.valueStruct);

        self.uint256_int.replace(msg.keyUint256, msg.valueInt);
        self.uint256_int8.replace(msg.keyUint256, msg.valueInt8);
        self.uint256_int42.replace(msg.keyUint256, msg.valueInt42);
        self.uint256_int256.replace(msg.keyUint256, msg.valueInt256);
        self.uint256_uint8.replace(msg.keyUint256, msg.valueUint8);
        self.uint256_uint42.replace(msg.keyUint256, msg.valueUint42);
        self.uint256_uint256.replace(msg.keyUint256, msg.valueUint256);
        self.uint256_coins.replace(msg.keyUint256, msg.valueCoins);
        self.uint256_bool.replace(msg.keyUint256, msg.valueBool);
        self.uint256_cell.replace(msg.keyUint256, msg.valueCell);
        self.uint256_address.replace(msg.keyUint256, msg.valueAddress);
        self.uint256_struct.replace(msg.keyUint256, msg.valueStruct);

        // Address Key Maps
        self.address_int.replace(msg.keyAddress, msg.valueInt);
        self.address_int8.replace(msg.keyAddress, msg.valueInt8);
        self.address_int42.replace(msg.keyAddress, msg.valueInt42);
        self.address_int256.replace(msg.keyAddress, msg.valueInt256);
        self.address_uint8.replace(msg.keyAddress, msg.valueUint8);
        self.address_uint42.replace(msg.keyAddress, msg.valueUint42);
        self.address_uint256.replace(msg.keyAddress, msg.valueUint256);
        self.address_coins.replace(msg.keyAddress, msg.valueCoins);
        self.address_bool.replace(msg.keyAddress, msg.valueBool);
        self.address_cell.replace(msg.keyAddress, msg.valueCell);
        self.address_address.replace(msg.keyAddress, msg.valueAddress);
        self.address_struct.replace(msg.keyAddress, msg.valueStruct);
    }

    receive(msg: ReplaceGetAllMaps) {
        // Integer Key Maps
        self.int_int.replaceGet(msg.keyInt, msg.valueInt);
        self.int_int8.replaceGet(msg.keyInt, msg.valueInt8);
        self.int_int42.replaceGet(msg.keyInt, msg.valueInt42);
        self.int_int256.replaceGet(msg.keyInt, msg.valueInt256);
        self.int_uint8.replaceGet(msg.keyInt, msg.valueUint8);
        self.int_uint42.replaceGet(msg.keyInt, msg.valueUint42);
        self.int_uint256.replaceGet(msg.keyInt, msg.valueUint256);
        self.int_coins.replaceGet(msg.keyInt, msg.valueCoins);
        self.int_bool.replaceGet(msg.keyInt, msg.valueBool);
        self.int_cell.replaceGet(msg.keyInt, msg.valueCell);
        self.int_address.replaceGet(msg.keyInt, msg.valueAddress);
        self.int_struct.replaceGet(msg.keyInt, msg.valueStruct);

        self.int8_int.replaceGet(msg.keyInt8, msg.valueInt);
        self.int8_int8.replaceGet(msg.keyInt8, msg.valueInt8);
        self.int8_int42.replaceGet(msg.keyInt8, msg.valueInt42);
        self.int8_int256.replaceGet(msg.keyInt8, msg.valueInt256);
        self.int8_uint8.replaceGet(msg.keyInt8, msg.valueUint8);
        self.int8_uint42.replaceGet(msg.keyInt8, msg.valueUint42);
        self.int8_uint256.replaceGet(msg.keyInt8, msg.valueUint256);
        self.int8_coins.replaceGet(msg.keyInt8, msg.valueCoins);
        self.int8_bool.replaceGet(msg.keyInt8, msg.valueBool);
        self.int8_cell.replaceGet(msg.keyInt8, msg.valueCell);
        self.int8_address.replaceGet(msg.keyInt8, msg.valueAddress);
        self.int8_struct.replaceGet(msg.keyInt8, msg.valueStruct);

        self.int42_int.replaceGet(msg.keyInt42, msg.valueInt);
        self.int42_int8.replaceGet(msg.keyInt42, msg.valueInt8);
        self.int42_int42.replaceGet(msg.keyInt42, msg.valueInt42);
        self.int42_int256.replaceGet(msg.keyInt42, msg.valueInt256);
        self.int42_uint8.replaceGet(msg.keyInt42, msg.valueUint8);
        self.int42_uint42.replaceGet(msg.keyInt42, msg.valueUint42);
        self.int42_uint256.replaceGet(msg.keyInt42, msg.valueUint256);
        self.int42_coins.replaceGet(msg.keyInt42, msg.valueCoins);
        self.int42_bool.replaceGet(msg.keyInt42, msg.valueBool);
        self.int42_cell.replaceGet(msg.keyInt42, msg.valueCell);
        self.int42_address.replaceGet(msg.keyInt42, msg.valueAddress);
        self.int42_struct.replaceGet(msg.keyInt42, msg.valueStruct);

        self.int256_int.replaceGet(msg.keyInt256, msg.valueInt);
        self.int256_int8.replaceGet(msg.keyInt256, msg.valueInt8);
        self.int256_int42.replaceGet(msg.keyInt256, msg.valueInt42);
        self.int256_int256.replaceGet(msg.keyInt256, msg.valueInt256);
        self.int256_uint8.replaceGet(msg.keyInt256, msg.valueUint8);
        self.int256_uint42.replaceGet(msg.keyInt256, msg.valueUint42);
        self.int256_uint256.replaceGet(msg.keyInt256, msg.valueUint256);
        self.int256_coins.replaceGet(msg.keyInt256, msg.valueCoins);
        self.int256_bool.replaceGet(msg.keyInt256, msg.valueBool);
        self.int256_cell.replaceGet(msg.keyInt256, msg.valueCell);
        self.int256_address.replaceGet(msg.keyInt256, msg.valueAddress);
        self.int256_struct.replaceGet(msg.keyInt256, msg.valueStruct);

        self.uint8_int.replaceGet(msg.keyUint8, msg.valueInt);
        self.uint8_int8.replaceGet(msg.keyUint8, msg.valueInt8);
        self.uint8_int42.replaceGet(msg.keyUint8, msg.valueInt42);
        self.uint8_int256.replaceGet(msg.keyUint8, msg.valueInt256);
        self.uint8_uint8.replaceGet(msg.keyUint8, msg.valueUint8);
        self.uint8_uint42.replaceGet(msg.keyUint8, msg.valueUint42);
        self.uint8_uint256.replaceGet(msg.keyUint8, msg.valueUint256);
        self.uint8_coins.replaceGet(msg.keyUint8, msg.valueCoins);
        self.uint8_bool.replaceGet(msg.keyUint8, msg.valueBool);
        self.uint8_cell.replaceGet(msg.keyUint8, msg.valueCell);
        self.uint8_address.replaceGet(msg.keyUint8, msg.valueAddress);
        self.uint8_struct.replaceGet(msg.keyUint8, msg.valueStruct);

        self.uint42_int.replaceGet(msg.keyUint42, msg.valueInt);
        self.uint42_int8.replaceGet(msg.keyUint42, msg.valueInt8);
        self.uint42_int42.replaceGet(msg.keyUint42, msg.valueInt42);
        self.uint42_int256.replaceGet(msg.keyUint42, msg.valueInt256);
        self.uint42_uint8.replaceGet(msg.keyUint42, msg.valueUint8);
        self.uint42_uint42.replaceGet(msg.keyUint42, msg.valueUint42);
        self.uint42_uint256.replaceGet(msg.keyUint42, msg.valueUint256);
        self.uint42_coins.replaceGet(msg.keyUint42, msg.valueCoins);
        self.uint42_bool.replaceGet(msg.keyUint42, msg.valueBool);
        self.uint42_cell.replaceGet(msg.keyUint42, msg.valueCell);
        self.uint42_address.replaceGet(msg.keyUint42, msg.valueAddress);
        self.uint42_struct.replaceGet(msg.keyUint42, msg.valueStruct);

        self.uint256_int.replaceGet(msg.keyUint256, msg.valueInt);
        self.uint256_int8.replaceGet(msg.keyUint256, msg.valueInt8);
        self.uint256_int42.replaceGet(msg.keyUint256, msg.valueInt42);
        self.uint256_int256.replaceGet(msg.keyUint256, msg.valueInt256);
        self.uint256_uint8.replaceGet(msg.keyUint256, msg.valueUint8);
        self.uint256_uint42.replaceGet(msg.keyUint256, msg.valueUint42);
        self.uint256_uint256.replaceGet(msg.keyUint256, msg.valueUint256);
        self.uint256_coins.replaceGet(msg.keyUint256, msg.valueCoins);
        self.uint256_bool.replaceGet(msg.keyUint256, msg.valueBool);
        self.uint256_cell.replaceGet(msg.keyUint256, msg.valueCell);
        self.uint256_address.replaceGet(msg.keyUint256, msg.valueAddress);
        self.uint256_struct.replaceGet(msg.keyUint256, msg.valueStruct);

        // Address Key Maps
        self.address_int.replaceGet(msg.keyAddress, msg.valueInt);
        self.address_int8.replaceGet(msg.keyAddress, msg.valueInt8);
        self.address_int42.replaceGet(msg.keyAddress, msg.valueInt42);
        self.address_int256.replaceGet(msg.keyAddress, msg.valueInt256);
        self.address_uint8.replaceGet(msg.keyAddress, msg.valueUint8);
        self.address_uint42.replaceGet(msg.keyAddress, msg.valueUint42);
        self.address_uint256.replaceGet(msg.keyAddress, msg.valueUint256);
        self.address_coins.replaceGet(msg.keyAddress, msg.valueCoins);
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
            int_int: self.int_int.get(keyInt),
            int_int8: self.int_int8.get(keyInt),
            int_int42: self.int_int42.get(keyInt),
            int_int256: self.int_int256.get(keyInt),
            int_uint8: self.int_uint8.get(keyInt),
            int_uint42: self.int_uint42.get(keyInt),
            int_uint256: self.int_uint256.get(keyInt),
            int_coins: self.int_coins.get(keyInt),
            int_bool: self.int_bool.get(keyInt),
            int_cell: self.int_cell.get(keyInt),
            int_address: self.int_address.get(keyInt),
            int_struct: self.int_struct.get(keyInt),

            int8_int: self.int8_int.get(keyInt8),
            int8_int8: self.int8_int8.get(keyInt8),
            int8_int42: self.int8_int42.get(keyInt8),
            int8_int256: self.int8_int256.get(keyInt8),
            int8_uint8: self.int8_uint8.get(keyInt8),
            int8_uint42: self.int8_uint42.get(keyInt8),
            int8_uint256: self.int8_uint256.get(keyInt8),
            int8_coins: self.int8_coins.get(keyInt8),
            int8_bool: self.int8_bool.get(keyInt8),
            int8_cell: self.int8_cell.get(keyInt8),
            int8_address: self.int8_address.get(keyInt8),
            int8_struct: self.int8_struct.get(keyInt8),

            int42_int: self.int42_int.get(keyInt42),
            int42_int8: self.int42_int8.get(keyInt42),
            int42_int42: self.int42_int42.get(keyInt42),
            int42_int256: self.int42_int256.get(keyInt42),
            int42_uint8: self.int42_uint8.get(keyInt42),
            int42_uint42: self.int42_uint42.get(keyInt42),
            int42_uint256: self.int42_uint256.get(keyInt42),
            int42_coins: self.int42_coins.get(keyInt42),
            int42_bool: self.int42_bool.get(keyInt42),
            int42_cell: self.int42_cell.get(keyInt42),
            int42_address: self.int42_address.get(keyInt42),
            int42_struct: self.int42_struct.get(keyInt42),

            int256_int: self.int256_int.get(keyInt256),
            int256_int8: self.int256_int8.get(keyInt256),
            int256_int42: self.int256_int42.get(keyInt256),
            int256_int256: self.int256_int256.get(keyInt256),
            int256_uint8: self.int256_uint8.get(keyInt256),
            int256_uint42: self.int256_uint42.get(keyInt256),
            int256_uint256: self.int256_uint256.get(keyInt256),
            int256_coins: self.int256_coins.get(keyInt256),
            int256_bool: self.int256_bool.get(keyInt256),
            int256_cell: self.int256_cell.get(keyInt256),
            int256_address: self.int256_address.get(keyInt256),
            int256_struct: self.int256_struct.get(keyInt256),

            uint8_int: self.uint8_int.get(keyUint8),
            uint8_int8: self.uint8_int8.get(keyUint8),
            uint8_int42: self.uint8_int42.get(keyUint8),
            uint8_int256: self.uint8_int256.get(keyUint8),
            uint8_uint8: self.uint8_uint8.get(keyUint8),
            uint8_uint42: self.uint8_uint42.get(keyUint8),
            uint8_uint256: self.uint8_uint256.get(keyUint8),
            uint8_coins: self.uint8_coins.get(keyUint8),
            uint8_bool: self.uint8_bool.get(keyUint8),
            uint8_cell: self.uint8_cell.get(keyUint8),
            uint8_address: self.uint8_address.get(keyUint8),
            uint8_struct: self.uint8_struct.get(keyUint8),

            uint42_int: self.uint42_int.get(keyUint42),
            uint42_int8: self.uint42_int8.get(keyUint42),
            uint42_int42: self.uint42_int42.get(keyUint42),
            uint42_int256: self.uint42_int256.get(keyUint42),
            uint42_uint8: self.uint42_uint8.get(keyUint42),
            uint42_uint42: self.uint42_uint42.get(keyUint42),
            uint42_uint256: self.uint42_uint256.get(keyUint42),
            uint42_coins: self.uint42_coins.get(keyUint42),
            uint42_bool: self.uint42_bool.get(keyUint42),
            uint42_cell: self.uint42_cell.get(keyUint42),
            uint42_address: self.uint42_address.get(keyUint42),
            uint42_struct: self.uint42_struct.get(keyUint42),

            uint256_int: self.uint256_int.get(keyUint256),
            uint256_int8: self.uint256_int8.get(keyUint256),
            uint256_int42: self.uint256_int42.get(keyUint256),
            uint256_int256: self.uint256_int256.get(keyUint256),
            uint256_uint8: self.uint256_uint8.get(keyUint256),
            uint256_uint42: self.uint256_uint42.get(keyUint256),
            uint256_uint256: self.uint256_uint256.get(keyUint256),
            uint256_coins: self.uint256_coins.get(keyUint256),
            uint256_bool: self.uint256_bool.get(keyUint256),
            uint256_cell: self.uint256_cell.get(keyUint256),
            uint256_address: self.uint256_address.get(keyUint256),
            uint256_struct: self.uint256_struct.get(keyUint256),

            // Address Key Maps
            address_int: self.address_int.get(keyAddress),
            address_int8: self.address_int8.get(keyAddress),
            address_int42: self.address_int42.get(keyAddress),
            address_int256: self.address_int256.get(keyAddress),
            address_uint8: self.address_uint8.get(keyAddress),
            address_uint42: self.address_uint42.get(keyAddress),
            address_uint256: self.address_uint256.get(keyAddress),
            address_coins: self.address_coins.get(keyAddress),
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
        valueInt: Int,
        valueInt8: Int,
        valueInt42: Int,
        valueInt256: Int,
        valueUint8: Int,
        valueUint42: Int,
        valueUint256: Int,
        valueCoins: Int,
        valueBool: Bool,
        valueCell: Cell,
        valueAddress: Address,
        valueStruct: SomeStruct
    ): ReplaceAllMapsResult {
        return ReplaceAllMapsResult {
            // Integer Key Maps
            int_int: self.int_int.replace(keyInt, valueInt),
            int_int8: self.int_int8.replace(keyInt, valueInt8),
            int_int42: self.int_int42.replace(keyInt, valueInt42),
            int_int256: self.int_int256.replace(keyInt, valueInt256),
            int_uint8: self.int_uint8.replace(keyInt, valueUint8),
            int_uint42: self.int_uint42.replace(keyInt, valueUint42),
            int_uint256: self.int_uint256.replace(keyInt, valueUint256),
            int_coins: self.int_coins.replace(keyInt, valueCoins),
            int_bool: self.int_bool.replace(keyInt, valueBool),
            int_cell: self.int_cell.replace(keyInt, valueCell),
            int_address: self.int_address.replace(keyInt, valueAddress),
            int_struct: self.int_struct.replace(keyInt, valueStruct),

            int8_int: self.int8_int.replace(keyInt8, valueInt),
            int8_int8: self.int8_int8.replace(keyInt8, valueInt8),
            int8_int42: self.int8_int42.replace(keyInt8, valueInt42),
            int8_int256: self.int8_int256.replace(keyInt8, valueInt256),
            int8_uint8: self.int8_uint8.replace(keyInt8, valueUint8),
            int8_uint42: self.int8_uint42.replace(keyInt8, valueUint42),
            int8_uint256: self.int8_uint256.replace(keyInt8, valueUint256),
            int8_coins: self.int8_coins.replace(keyInt8, valueCoins),
            int8_bool: self.int8_bool.replace(keyInt8, valueBool),
            int8_cell: self.int8_cell.replace(keyInt8, valueCell),
            int8_address: self.int8_address.replace(keyInt8, valueAddress),
            int8_struct: self.int8_struct.replace(keyInt8, valueStruct),

            int42_int: self.int42_int.replace(keyInt42, valueInt),
            int42_int8: self.int42_int8.replace(keyInt42, valueInt8),
            int42_int42: self.int42_int42.replace(keyInt42, valueInt42),
            int42_int256: self.int42_int256.replace(keyInt42, valueInt256),
            int42_uint8: self.int42_uint8.replace(keyInt42, valueUint8),
            int42_uint42: self.int42_uint42.replace(keyInt42, valueUint42),
            int42_uint256: self.int42_uint256.replace(keyInt42, valueUint256),
            int42_coins: self.int42_coins.replace(keyInt42, valueCoins),
            int42_bool: self.int42_bool.replace(keyInt42, valueBool),
            int42_cell: self.int42_cell.replace(keyInt42, valueCell),
            int42_address: self.int42_address.replace(keyInt42, valueAddress),
            int42_struct: self.int42_struct.replace(keyInt42, valueStruct),

            int256_int: self.int256_int.replace(keyInt256, valueInt),
            int256_int8: self.int256_int8.replace(keyInt256, valueInt8),
            int256_int42: self.int256_int42.replace(keyInt256, valueInt42),
            int256_int256: self.int256_int256.replace(keyInt256, valueInt256),
            int256_uint8: self.int256_uint8.replace(keyInt256, valueUint8),
            int256_uint42: self.int256_uint42.replace(keyInt256, valueUint42),
            int256_uint256: self.int256_uint256.replace(keyInt256, valueUint256),
            int256_coins: self.int256_coins.replace(keyInt256, valueCoins),
            int256_bool: self.int256_bool.replace(keyInt256, valueBool),
            int256_cell: self.int256_cell.replace(keyInt256, valueCell),
            int256_address: self.int256_address.replace(keyInt256, valueAddress),
            int256_struct: self.int256_struct.replace(keyInt256, valueStruct),

            uint8_int: self.uint8_int.replace(keyUint8, valueInt),
            uint8_int8: self.uint8_int8.replace(keyUint8, valueInt8),
            uint8_int42: self.uint8_int42.replace(keyUint8, valueInt42),
            uint8_int256: self.uint8_int256.replace(keyUint8, valueInt256),
            uint8_uint8: self.uint8_uint8.replace(keyUint8, valueUint8),
            uint8_uint42: self.uint8_uint42.replace(keyUint8, valueUint42),
            uint8_uint256: self.uint8_uint256.replace(keyUint8, valueUint256),
            uint8_coins: self.uint8_coins.replace(keyUint8, valueCoins),
            uint8_bool: self.uint8_bool.replace(keyUint8, valueBool),
            uint8_cell: self.uint8_cell.replace(keyUint8, valueCell),
            uint8_address: self.uint8_address.replace(keyUint8, valueAddress),
            uint8_struct: self.uint8_struct.replace(keyUint8, valueStruct),

            uint42_int: self.uint42_int.replace(keyUint42, valueInt),
            uint42_int8: self.uint42_int8.replace(keyUint42, valueInt8),
            uint42_int42: self.uint42_int42.replace(keyUint42, valueInt42),
            uint42_int256: self.uint42_int256.replace(keyUint42, valueInt256),
            uint42_uint8: self.uint42_uint8.replace(keyUint42, valueUint8),
            uint42_uint42: self.uint42_uint42.replace(keyUint42, valueUint42),
            uint42_uint256: self.uint42_uint256.replace(keyUint42, valueUint256),
            uint42_coins: self.uint42_coins.replace(keyUint42, valueCoins),
            uint42_bool: self.uint42_bool.replace(keyUint42, valueBool),
            uint42_cell: self.uint42_cell.replace(keyUint42, valueCell),
            uint42_address: self.uint42_address.replace(keyUint42, valueAddress),
            uint42_struct: self.uint42_struct.replace(keyUint42, valueStruct),

            uint256_int: self.uint256_int.replace(keyUint256, valueInt),
            uint256_int8: self.uint256_int8.replace(keyUint256, valueInt8),
            uint256_int42: self.uint256_int42.replace(keyUint256, valueInt42),
            uint256_int256: self.uint256_int256.replace(keyUint256, valueInt256),
            uint256_uint8: self.uint256_uint8.replace(keyUint256, valueUint8),
            uint256_uint42: self.uint256_uint42.replace(keyUint256, valueUint42),
            uint256_uint256: self.uint256_uint256.replace(keyUint256, valueUint256),
            uint256_coins: self.uint256_coins.replace(keyUint256, valueCoins),
            uint256_bool: self.uint256_bool.replace(keyUint256, valueBool),
            uint256_cell: self.uint256_cell.replace(keyUint256, valueCell),
            uint256_address: self.uint256_address.replace(keyUint256, valueAddress),
            uint256_struct: self.uint256_struct.replace(keyUint256, valueStruct),

            // Address Key Maps
            address_int: self.address_int.replace(keyAddress, valueInt),
            address_int8: self.address_int8.replace(keyAddress, valueInt8),
            address_int42: self.address_int42.replace(keyAddress, valueInt42),
            address_int256: self.address_int256.replace(keyAddress, valueInt256),
            address_uint8: self.address_uint8.replace(keyAddress, valueUint8),
            address_uint42: self.address_uint42.replace(keyAddress, valueUint42),
            address_uint256: self.address_uint256.replace(keyAddress, valueUint256),
            address_coins: self.address_coins.replace(keyAddress, valueCoins),
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
        valueInt: Int,
        valueInt8: Int,
        valueInt42: Int,
        valueInt256: Int,
        valueUint8: Int,
        valueUint42: Int,
        valueUint256: Int,
        valueCoins: Int,
        valueBool: Bool,
        valueCell: Cell,
        valueAddress: Address,
        valueStruct: SomeStruct
    ): ReplaceGetAllMapsResult {
        return ReplaceGetAllMapsResult {
            // Integer Key Maps
            int_int: self.int_int.replaceGet(keyInt, valueInt),
            int_int8: self.int_int8.replaceGet(keyInt, valueInt8),
            int_int42: self.int_int42.replaceGet(keyInt, valueInt42),
            int_int256: self.int_int256.replaceGet(keyInt, valueInt256),
            int_uint8: self.int_uint8.replaceGet(keyInt, valueUint8),
            int_uint42: self.int_uint42.replaceGet(keyInt, valueUint42),
            int_uint256: self.int_uint256.replaceGet(keyInt, valueUint256),
            int_coins: self.int_coins.replaceGet(keyInt, valueCoins),
            int_bool: self.int_bool.replaceGet(keyInt, valueBool),
            int_cell: self.int_cell.replaceGet(keyInt, valueCell),
            int_address: self.int_address.replaceGet(keyInt, valueAddress),
            int_struct: self.int_struct.replaceGet(keyInt, valueStruct),

            int8_int: self.int8_int.replaceGet(keyInt8, valueInt),
            int8_int8: self.int8_int8.replaceGet(keyInt8, valueInt8),
            int8_int42: self.int8_int42.replaceGet(keyInt8, valueInt42),
            int8_int256: self.int8_int256.replaceGet(keyInt8, valueInt256),
            int8_uint8: self.int8_uint8.replaceGet(keyInt8, valueUint8),
            int8_uint42: self.int8_uint42.replaceGet(keyInt8, valueUint42),
            int8_uint256: self.int8_uint256.replaceGet(keyInt8, valueUint256),
            int8_coins: self.int8_coins.replaceGet(keyInt8, valueCoins),
            int8_bool: self.int8_bool.replaceGet(keyInt8, valueBool),
            int8_cell: self.int8_cell.replaceGet(keyInt8, valueCell),
            int8_address: self.int8_address.replaceGet(keyInt8, valueAddress),
            int8_struct: self.int8_struct.replaceGet(keyInt8, valueStruct),

            int42_int: self.int42_int.replaceGet(keyInt42, valueInt),
            int42_int8: self.int42_int8.replaceGet(keyInt42, valueInt8),
            int42_int42: self.int42_int42.replaceGet(keyInt42, valueInt42),
            int42_int256: self.int42_int256.replaceGet(keyInt42, valueInt256),
            int42_uint8: self.int42_uint8.replaceGet(keyInt42, valueUint8),
            int42_uint42: self.int42_uint42.replaceGet(keyInt42, valueUint42),
            int42_uint256: self.int42_uint256.replaceGet(keyInt42, valueUint256),
            int42_coins: self.int42_coins.replaceGet(keyInt42, valueCoins),
            int42_bool: self.int42_bool.replaceGet(keyInt42, valueBool),
            int42_cell: self.int42_cell.replaceGet(keyInt42, valueCell),
            int42_address: self.int42_address.replaceGet(keyInt42, valueAddress),
            int42_struct: self.int42_struct.replaceGet(keyInt42, valueStruct),

            int256_int: self.int256_int.replaceGet(keyInt256, valueInt),
            int256_int8: self.int256_int8.replaceGet(keyInt256, valueInt8),
            int256_int42: self.int256_int42.replaceGet(keyInt256, valueInt42),
            int256_int256: self.int256_int256.replaceGet(keyInt256, valueInt256),
            int256_uint8: self.int256_uint8.replaceGet(keyInt256, valueUint8),
            int256_uint42: self.int256_uint42.replaceGet(keyInt256, valueUint42),
            int256_uint256: self.int256_uint256.replaceGet(keyInt256, valueUint256),
            int256_coins: self.int256_coins.replaceGet(keyInt256, valueCoins),
            int256_bool: self.int256_bool.replaceGet(keyInt256, valueBool),
            int256_cell: self.int256_cell.replaceGet(keyInt256, valueCell),
            int256_address: self.int256_address.replaceGet(keyInt256, valueAddress),
            int256_struct: self.int256_struct.replaceGet(keyInt256, valueStruct),

            uint8_int: self.uint8_int.replaceGet(keyUint8, valueInt),
            uint8_int8: self.uint8_int8.replaceGet(keyUint8, valueInt8),
            uint8_int42: self.uint8_int42.replaceGet(keyUint8, valueInt42),
            uint8_int256: self.uint8_int256.replaceGet(keyUint8, valueInt256),
            uint8_uint8: self.uint8_uint8.replaceGet(keyUint8, valueUint8),
            uint8_uint42: self.uint8_uint42.replaceGet(keyUint8, valueUint42),
            uint8_uint256: self.uint8_uint256.replaceGet(keyUint8, valueUint256),
            uint8_coins: self.uint8_coins.replaceGet(keyUint8, valueCoins),
            uint8_bool: self.uint8_bool.replaceGet(keyUint8, valueBool),
            uint8_cell: self.uint8_cell.replaceGet(keyUint8, valueCell),
            uint8_address: self.uint8_address.replaceGet(keyUint8, valueAddress),
            uint8_struct: self.uint8_struct.replaceGet(keyUint8, valueStruct),

            uint42_int: self.uint42_int.replaceGet(keyUint42, valueInt),
            uint42_int8: self.uint42_int8.replaceGet(keyUint42, valueInt8),
            uint42_int42: self.uint42_int42.replaceGet(keyUint42, valueInt42),
            uint42_int256: self.uint42_int256.replaceGet(keyUint42, valueInt256),
            uint42_uint8: self.uint42_uint8.replaceGet(keyUint42, valueUint8),
            uint42_uint42: self.uint42_uint42.replaceGet(keyUint42, valueUint42),
            uint42_uint256: self.uint42_uint256.replaceGet(keyUint42, valueUint256),
            uint42_coins: self.uint42_coins.replaceGet(keyUint42, valueCoins),
            uint42_bool: self.uint42_bool.replaceGet(keyUint42, valueBool),
            uint42_cell: self.uint42_cell.replaceGet(keyUint42, valueCell),
            uint42_address: self.uint42_address.replaceGet(keyUint42, valueAddress),
            uint42_struct: self.uint42_struct.replaceGet(keyUint42, valueStruct),

            uint256_int: self.uint256_int.replaceGet(keyUint256, valueInt),
            uint256_int8: self.uint256_int8.replaceGet(keyUint256, valueInt8),
            uint256_int42: self.uint256_int42.replaceGet(keyUint256, valueInt42),
            uint256_int256: self.uint256_int256.replaceGet(keyUint256, valueInt256),
            uint256_uint8: self.uint256_uint8.replaceGet(keyUint256, valueUint8),
            uint256_uint42: self.uint256_uint42.replaceGet(keyUint256, valueUint42),
            uint256_uint256: self.uint256_uint256.replaceGet(keyUint256, valueUint256),
            uint256_coins: self.uint256_coins.replaceGet(keyUint256, valueCoins),
            uint256_bool: self.uint256_bool.replaceGet(keyUint256, valueBool),
            uint256_cell: self.uint256_cell.replaceGet(keyUint256, valueCell),
            uint256_address: self.uint256_address.replaceGet(keyUint256, valueAddress),
            uint256_struct: self.uint256_struct.replaceGet(keyUint256, valueStruct),

            // Address Key Maps
            address_int: self.address_int.replaceGet(keyAddress, valueInt),
            address_int8: self.address_int8.replaceGet(keyAddress, valueInt8),
            address_int42: self.address_int42.replaceGet(keyAddress, valueInt42),
            address_int256: self.address_int256.replaceGet(keyAddress, valueInt256),
            address_uint8: self.address_uint8.replaceGet(keyAddress, valueUint8),
            address_uint42: self.address_uint42.replaceGet(keyAddress, valueUint42),
            address_uint256: self.address_uint256.replaceGet(keyAddress, valueUint256),
            address_coins: self.address_coins.replaceGet(keyAddress, valueCoins),
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
            int_int: self.int_int.exists(keyInt),
            int_int8: self.int_int8.exists(keyInt),
            int_int42: self.int_int42.exists(keyInt),
            int_int256: self.int_int256.exists(keyInt),
            int_uint8: self.int_uint8.exists(keyInt),
            int_uint42: self.int_uint42.exists(keyInt),
            int_uint256: self.int_uint256.exists(keyInt),
            int_coins: self.int_coins.exists(keyInt),
            int_bool: self.int_bool.exists(keyInt),
            int_cell: self.int_cell.exists(keyInt),
            int_address: self.int_address.exists(keyInt),
            int_struct: self.int_struct.exists(keyInt),

            int8_int: self.int8_int.exists(keyInt8),
            int8_int8: self.int8_int8.exists(keyInt8),
            int8_int42: self.int8_int42.exists(keyInt8),
            int8_int256: self.int8_int256.exists(keyInt8),
            int8_uint8: self.int8_uint8.exists(keyInt8),
            int8_uint42: self.int8_uint42.exists(keyInt8),
            int8_uint256: self.int8_uint256.exists(keyInt8),
            int8_coins: self.int8_coins.exists(keyInt8),
            int8_bool: self.int8_bool.exists(keyInt8),
            int8_cell: self.int8_cell.exists(keyInt8),
            int8_address: self.int8_address.exists(keyInt8),
            int8_struct: self.int8_struct.exists(keyInt8),

            int42_int: self.int42_int.exists(keyInt42),
            int42_int8: self.int42_int8.exists(keyInt42),
            int42_int42: self.int42_int42.exists(keyInt42),
            int42_int256: self.int42_int256.exists(keyInt42),
            int42_uint8: self.int42_uint8.exists(keyInt42),
            int42_uint42: self.int42_uint42.exists(keyInt42),
            int42_uint256: self.int42_uint256.exists(keyInt42),
            int42_coins: self.int42_coins.exists(keyInt42),
            int42_bool: self.int42_bool.exists(keyInt42),
            int42_cell: self.int42_cell.exists(keyInt42),
            int42_address: self.int42_address.exists(keyInt42),
            int42_struct: self.int42_struct.exists(keyInt42),

            int256_int: self.int256_int.exists(keyInt256),
            int256_int8: self.int256_int8.exists(keyInt256),
            int256_int42: self.int256_int42.exists(keyInt256),
            int256_int256: self.int256_int256.exists(keyInt256),
            int256_uint8: self.int256_uint8.exists(keyInt256),
            int256_uint42: self.int256_uint42.exists(keyInt256),
            int256_uint256: self.int256_uint256.exists(keyInt256),
            int256_coins: self.int256_coins.exists(keyInt256),
            int256_bool: self.int256_bool.exists(keyInt256),
            int256_cell: self.int256_cell.exists(keyInt256),
            int256_address: self.int256_address.exists(keyInt256),
            int256_struct: self.int256_struct.exists(keyInt256),

            uint8_int: self.uint8_int.exists(keyUint8),
            uint8_int8: self.uint8_int8.exists(keyUint8),
            uint8_int42: self.uint8_int42.exists(keyUint8),
            uint8_int256: self.uint8_int256.exists(keyUint8),
            uint8_uint8: self.uint8_uint8.exists(keyUint8),
            uint8_uint42: self.uint8_uint42.exists(keyUint8),
            uint8_uint256: self.uint8_uint256.exists(keyUint8),
            uint8_coins: self.uint8_coins.exists(keyUint8),
            uint8_bool: self.uint8_bool.exists(keyUint8),
            uint8_cell: self.uint8_cell.exists(keyUint8),
            uint8_address: self.uint8_address.exists(keyUint8),
            uint8_struct: self.uint8_struct.exists(keyUint8),

            uint42_int: self.uint42_int.exists(keyUint42),
            uint42_int8: self.uint42_int8.exists(keyUint42),
            uint42_int42: self.uint42_int42.exists(keyUint42),
            uint42_int256: self.uint42_int256.exists(keyUint42),
            uint42_uint8: self.uint42_uint8.exists(keyUint42),
            uint42_uint42: self.uint42_uint42.exists(keyUint42),
            uint42_uint256: self.uint42_uint256.exists(keyUint42),
            uint42_coins: self.uint42_coins.exists(keyUint42),
            uint42_bool: self.uint42_bool.exists(keyUint42),
            uint42_cell: self.uint42_cell.exists(keyUint42),
            uint42_address: self.uint42_address.exists(keyUint42),
            uint42_struct: self.uint42_struct.exists(keyUint42),

            uint256_int: self.uint256_int.exists(keyUint256),
            uint256_int8: self.uint256_int8.exists(keyUint256),
            uint256_int42: self.uint256_int42.exists(keyUint256),
            uint256_int256: self.uint256_int256.exists(keyUint256),
            uint256_uint8: self.uint256_uint8.exists(keyUint256),
            uint256_uint42: self.uint256_uint42.exists(keyUint256),
            uint256_uint256: self.uint256_uint256.exists(keyUint256),
            uint256_coins: self.uint256_coins.exists(keyUint256),
            uint256_bool: self.uint256_bool.exists(keyUint256),
            uint256_cell: self.uint256_cell.exists(keyUint256),
            uint256_address: self.uint256_address.exists(keyUint256),
            uint256_struct: self.uint256_struct.exists(keyUint256),

            // Address Key Maps
            address_int: self.address_int.exists(keyAddress),
            address_int8: self.address_int8.exists(keyAddress),
            address_int42: self.address_int42.exists(keyAddress),
            address_int256: self.address_int256.exists(keyAddress),
            address_uint8: self.address_uint8.exists(keyAddress),
            address_uint42: self.address_uint42.exists(keyAddress),
            address_uint256: self.address_uint256.exists(keyAddress),
            address_coins: self.address_coins.exists(keyAddress),
            address_bool: self.address_bool.exists(keyAddress),
            address_cell: self.address_cell.exists(keyAddress),
            address_address: self.address_address.exists(keyAddress),
            address_struct: self.address_struct.exists(keyAddress)
        };
    }

    get fun isEmptyAllMaps(): IsEmptyAllMapsResult {
        return IsEmptyAllMapsResult {
            // Integer Key Maps
            int_int: self.int_int.isEmpty(),
            int_int8: self.int_int8.isEmpty(),
            int_int42: self.int_int42.isEmpty(),
            int_int256: self.int_int256.isEmpty(),
            int_uint8: self.int_uint8.isEmpty(),
            int_uint42: self.int_uint42.isEmpty(),
            int_uint256: self.int_uint256.isEmpty(),
            int_coins: self.int_coins.isEmpty(),
            int_bool: self.int_bool.isEmpty(),
            int_cell: self.int_cell.isEmpty(),
            int_address: self.int_address.isEmpty(),
            int_struct: self.int_struct.isEmpty(),

            int8_int: self.int8_int.isEmpty(),
            int8_int8: self.int8_int8.isEmpty(),
            int8_int42: self.int8_int42.isEmpty(),
            int8_int256: self.int8_int256.isEmpty(),
            int8_uint8: self.int8_uint8.isEmpty(),
            int8_uint42: self.int8_uint42.isEmpty(),
            int8_uint256: self.int8_uint256.isEmpty(),
            int8_coins: self.int8_coins.isEmpty(),
            int8_bool: self.int8_bool.isEmpty(),
            int8_cell: self.int8_cell.isEmpty(),
            int8_address: self.int8_address.isEmpty(),
            int8_struct: self.int8_struct.isEmpty(),

            int42_int: self.int42_int.isEmpty(),
            int42_int8: self.int42_int8.isEmpty(),
            int42_int42: self.int42_int42.isEmpty(),
            int42_int256: self.int42_int256.isEmpty(),
            int42_uint8: self.int42_uint8.isEmpty(),
            int42_uint42: self.int42_uint42.isEmpty(),
            int42_uint256: self.int42_uint256.isEmpty(),
            int42_coins: self.int42_coins.isEmpty(),
            int42_bool: self.int42_bool.isEmpty(),
            int42_cell: self.int42_cell.isEmpty(),
            int42_address: self.int42_address.isEmpty(),
            int42_struct: self.int42_struct.isEmpty(),

            int256_int: self.int256_int.isEmpty(),
            int256_int8: self.int256_int8.isEmpty(),
            int256_int42: self.int256_int42.isEmpty(),
            int256_int256: self.int256_int256.isEmpty(),
            int256_uint8: self.int256_uint8.isEmpty(),
            int256_uint42: self.int256_uint42.isEmpty(),
            int256_uint256: self.int256_uint256.isEmpty(),
            int256_coins: self.int256_coins.isEmpty(),
            int256_bool: self.int256_bool.isEmpty(),
            int256_cell: self.int256_cell.isEmpty(),
            int256_address: self.int256_address.isEmpty(),
            int256_struct: self.int256_struct.isEmpty(),

            uint8_int: self.uint8_int.isEmpty(),
            uint8_int8: self.uint8_int8.isEmpty(),
            uint8_int42: self.uint8_int42.isEmpty(),
            uint8_int256: self.uint8_int256.isEmpty(),
            uint8_uint8: self.uint8_uint8.isEmpty(),
            uint8_uint42: self.uint8_uint42.isEmpty(),
            uint8_uint256: self.uint8_uint256.isEmpty(),
            uint8_coins: self.uint8_coins.isEmpty(),
            uint8_bool: self.uint8_bool.isEmpty(),
            uint8_cell: self.uint8_cell.isEmpty(),
            uint8_address: self.uint8_address.isEmpty(),
            uint8_struct: self.uint8_struct.isEmpty(),

            uint42_int: self.uint42_int.isEmpty(),
            uint42_int8: self.uint42_int8.isEmpty(),
            uint42_int42: self.uint42_int42.isEmpty(),
            uint42_int256: self.uint42_int256.isEmpty(),
            uint42_uint8: self.uint42_uint8.isEmpty(),
            uint42_uint42: self.uint42_uint42.isEmpty(),
            uint42_uint256: self.uint42_uint256.isEmpty(),
            uint42_coins: self.uint42_coins.isEmpty(),
            uint42_bool: self.uint42_bool.isEmpty(),
            uint42_cell: self.uint42_cell.isEmpty(),
            uint42_address: self.uint42_address.isEmpty(),
            uint42_struct: self.uint42_struct.isEmpty(),

            uint256_int: self.uint256_int.isEmpty(),
            uint256_int8: self.uint256_int8.isEmpty(),
            uint256_int42: self.uint256_int42.isEmpty(),
            uint256_int256: self.uint256_int256.isEmpty(),
            uint256_uint8: self.uint256_uint8.isEmpty(),
            uint256_uint42: self.uint256_uint42.isEmpty(),
            uint256_uint256: self.uint256_uint256.isEmpty(),
            uint256_coins: self.uint256_coins.isEmpty(),
            uint256_bool: self.uint256_bool.isEmpty(),
            uint256_cell: self.uint256_cell.isEmpty(),
            uint256_address: self.uint256_address.isEmpty(),
            uint256_struct: self.uint256_struct.isEmpty(),

            // Address Key Maps
            address_int: self.address_int.isEmpty(),
            address_int8: self.address_int8.isEmpty(),
            address_int42: self.address_int42.isEmpty(),
            address_int256: self.address_int256.isEmpty(),
            address_uint8: self.address_uint8.isEmpty(),
            address_uint42: self.address_uint42.isEmpty(),
            address_uint256: self.address_uint256.isEmpty(),
            address_coins: self.address_coins.isEmpty(),
            address_bool: self.address_bool.isEmpty(),
            address_cell: self.address_cell.isEmpty(),
            address_address: self.address_address.isEmpty(),
            address_struct: self.address_struct.isEmpty()
        };
    }

    get fun asCellAllMaps(): AsCellAllMapsResult {
        return AsCellAllMapsResult {
            // Integer Key Maps
            int_int: self.int_int.asCell(),
            int_int8: self.int_int8.asCell(),
            int_int42: self.int_int42.asCell(),
            int_int256: self.int_int256.asCell(),
            int_uint8: self.int_uint8.asCell(),
            int_uint42: self.int_uint42.asCell(),
            int_uint256: self.int_uint256.asCell(),
            int_coins: self.int_coins.asCell(),
            int_bool: self.int_bool.asCell(),
            int_cell: self.int_cell.asCell(),
            int_address: self.int_address.asCell(),
            int_struct: self.int_struct.asCell(),

            int8_int: self.int8_int.asCell(),
            int8_int8: self.int8_int8.asCell(),
            int8_int42: self.int8_int42.asCell(),
            int8_int256: self.int8_int256.asCell(),
            int8_uint8: self.int8_uint8.asCell(),
            int8_uint42: self.int8_uint42.asCell(),
            int8_uint256: self.int8_uint256.asCell(),
            int8_coins: self.int8_coins.asCell(),
            int8_bool: self.int8_bool.asCell(),
            int8_cell: self.int8_cell.asCell(),
            int8_address: self.int8_address.asCell(),
            int8_struct: self.int8_struct.asCell(),

            int42_int: self.int42_int.asCell(),
            int42_int8: self.int42_int8.asCell(),
            int42_int42: self.int42_int42.asCell(),
            int42_int256: self.int42_int256.asCell(),
            int42_uint8: self.int42_uint8.asCell(),
            int42_uint42: self.int42_uint42.asCell(),
            int42_uint256: self.int42_uint256.asCell(),
            int42_coins: self.int42_coins.asCell(),
            int42_bool: self.int42_bool.asCell(),
            int42_cell: self.int42_cell.asCell(),
            int42_address: self.int42_address.asCell(),
            int42_struct: self.int42_struct.asCell(),

            int256_int: self.int256_int.asCell(),
            int256_int8: self.int256_int8.asCell(),
            int256_int42: self.int256_int42.asCell(),
            int256_int256: self.int256_int256.asCell(),
            int256_uint8: self.int256_uint8.asCell(),
            int256_uint42: self.int256_uint42.asCell(),
            int256_uint256: self.int256_uint256.asCell(),
            int256_coins: self.int256_coins.asCell(),
            int256_bool: self.int256_bool.asCell(),
            int256_cell: self.int256_cell.asCell(),
            int256_address: self.int256_address.asCell(),
            int256_struct: self.int256_struct.asCell(),

            uint8_int: self.uint8_int.asCell(),
            uint8_int8: self.uint8_int8.asCell(),
            uint8_int42: self.uint8_int42.asCell(),
            uint8_int256: self.uint8_int256.asCell(),
            uint8_uint8: self.uint8_uint8.asCell(),
            uint8_uint42: self.uint8_uint42.asCell(),
            uint8_uint256: self.uint8_uint256.asCell(),
            uint8_coins: self.uint8_coins.asCell(),
            uint8_bool: self.uint8_bool.asCell(),
            uint8_cell: self.uint8_cell.asCell(),
            uint8_address: self.uint8_address.asCell(),
            uint8_struct: self.uint8_struct.asCell(),

            uint42_int: self.uint42_int.asCell(),
            uint42_int8: self.uint42_int8.asCell(),
            uint42_int42: self.uint42_int42.asCell(),
            uint42_int256: self.uint42_int256.asCell(),
            uint42_uint8: self.uint42_uint8.asCell(),
            uint42_uint42: self.uint42_uint42.asCell(),
            uint42_uint256: self.uint42_uint256.asCell(),
            uint42_coins: self.uint42_coins.asCell(),
            uint42_bool: self.uint42_bool.asCell(),
            uint42_cell: self.uint42_cell.asCell(),
            uint42_address: self.uint42_address.asCell(),
            uint42_struct: self.uint42_struct.asCell(),

            uint256_int: self.uint256_int.asCell(),
            uint256_int8: self.uint256_int8.asCell(),
            uint256_int42: self.uint256_int42.asCell(),
            uint256_int256: self.uint256_int256.asCell(),
            uint256_uint8: self.uint256_uint8.asCell(),
            uint256_uint42: self.uint256_uint42.asCell(),
            uint256_uint256: self.uint256_uint256.asCell(),
            uint256_coins: self.uint256_coins.asCell(),
            uint256_bool: self.uint256_bool.asCell(),
            uint256_cell: self.uint256_cell.asCell(),
            uint256_address: self.uint256_address.asCell(),
            uint256_struct: self.uint256_struct.asCell(),

            // Address Key Maps
            address_int: self.address_int.asCell(),
            address_int8: self.address_int8.asCell(),
            address_int42: self.address_int42.asCell(),
            address_int256: self.address_int256.asCell(),
            address_uint8: self.address_uint8.asCell(),
            address_uint42: self.address_uint42.asCell(),
            address_uint256: self.address_uint256.asCell(),
            address_coins: self.address_coins.asCell(),
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
