message SetIntMap1 {
    key: Int;
    value: Int?;
}

message SetIntMap2 {
    key: Int;
    value: Bool?;
}

message SetIntMap3 {
    key: Int;
    value: Cell?;
}

message SetIntMap4 {
    key: Int;
    value: SomeStruct?;
}

message SetIntMap5 {
    key: Int;
    value: Address?;
}

message SetIntMap6 {
    key: Int;
    value: Int?;
}

message SetUIntMap7 {
    key: Int;
    value: Int?;
}

message SetIntMap8 {
    key: Int;
    value: Int?;
}

message SetUIntMap9 {
    key: Int;
    value: Int?;
}

message SetAddrMap1 {
    key: Address;
    value: Int?;
}

message SetAddrMap2 {
    key: Address;
    value: Bool?;
}

message SetAddrMap3 {
    key: Address;
    value: Cell?;
}

message SetAddrMap4 {
    key: Address;
    value: SomeStruct?;
}

message SetAddrMap5 {
    key: Address;
    value: Address?;
}

message SetAddrMap6 {
    key: Address;
    value: Int?;
}

message SetAddrMap7 {
    key: Address;
    value: Int?;
}

struct SomeStruct {
    value: Int;
}

contract MapTestContract {

    init() {
        // Nothing to do
    }

    receive() {
        // Nothing to do
    }

    //
    // Int Maps
    //

    intMap1: map<Int, Int>;
    intMap2: map<Int, Bool>;
    intMap3: map<Int, Cell>;
    intMap4: map<Int, SomeStruct>;
    intMap5: map<Int, Address>;
    intMap6_1: map<Int as int8, Int>;
    intMap6_2: map<Int as int16, Int>;
    intMap6_3: map<Int as int32, Int>;
    intMap6_4: map<Int as int64, Int>;
    intMap6_5: map<Int as int128, Int>;
    intMap6_6: map<Int as int256, Int>;
    intMap6_7: map<Int as int257, Int>;

    intMap7_1: map<Int as uint8, Int>;
    intMap7_2: map<Int as uint16, Int>;
    intMap7_3: map<Int as uint32, Int>;
    intMap7_4: map<Int as uint64, Int>;
    intMap7_5: map<Int as uint128, Int>;
    intMap7_6: map<Int as uint256, Int>;

    intMap8_1: map<Int, Int as int8>;
    intMap8_2: map<Int, Int as int16>;
    intMap8_3: map<Int, Int as int32>;
    intMap8_4: map<Int, Int as int64>;
    intMap8_5: map<Int, Int as int128>;
    intMap8_6: map<Int, Int as int256>;
    intMap8_7: map<Int, Int as int257>;

    intMap9_1: map<Int, Int as uint8>;
    intMap9_2: map<Int, Int as uint16>;
    intMap9_3: map<Int, Int as uint32>;
    intMap9_4: map<Int, Int as uint64>;
    intMap9_5: map<Int, Int as uint128>;
    intMap9_6: map<Int, Int as uint256>;

    receive(msg: SetIntMap1) {
        self.intMap1.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap2) {
        self.intMap2.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap3) {
        self.intMap3.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap4) {
        self.intMap4.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap5) {
        self.intMap5.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap6) {
        self.intMap6_1.set(msg.key, msg.value);
        self.intMap6_2.set(msg.key, msg.value);
        self.intMap6_3.set(msg.key, msg.value);
        self.intMap6_4.set(msg.key, msg.value);
        self.intMap6_5.set(msg.key, msg.value);
        self.intMap6_6.set(msg.key, msg.value);
        self.intMap6_7.set(msg.key, msg.value);
    }

    receive(msg: SetUIntMap7) {
        self.intMap7_1.set(msg.key, msg.value);
        self.intMap7_2.set(msg.key, msg.value);
        self.intMap7_3.set(msg.key, msg.value);
        self.intMap7_4.set(msg.key, msg.value);
        self.intMap7_5.set(msg.key, msg.value);
        self.intMap7_6.set(msg.key, msg.value);
    }

    receive(msg: SetIntMap8) {
        self.intMap8_1.set(msg.key, msg.value);
        self.intMap8_2.set(msg.key, msg.value);
        self.intMap8_3.set(msg.key, msg.value);
        self.intMap8_4.set(msg.key, msg.value);
        self.intMap8_5.set(msg.key, msg.value);
        self.intMap8_6.set(msg.key, msg.value);
        self.intMap8_7.set(msg.key, msg.value);
    }

    receive(msg: SetUIntMap9) {
        self.intMap9_1.set(msg.key, msg.value);
        self.intMap9_2.set(msg.key, msg.value);
        self.intMap9_3.set(msg.key, msg.value);
        self.intMap9_4.set(msg.key, msg.value);
        self.intMap9_5.set(msg.key, msg.value);
        self.intMap9_6.set(msg.key, msg.value);
    }

    get fun intMap1(): map<Int, Int> {
        return self.intMap1;
    }

    get fun intMap1Value(key: Int): Int? {
        return self.intMap1.get(key);
    }

    get fun intMap2(): map<Int, Bool> {
        return self.intMap2;
    }

    get fun intMap2Value(key: Int): Bool? {
        return self.intMap2.get(key);
    }

    get fun intMap3(): map<Int, Cell> {
        return self.intMap3;
    }

    get fun intMap3Value(key: Int): Cell? {
        return self.intMap3.get(key);
    }

    get fun intMap4(): map<Int, SomeStruct> {
        return self.intMap4;
    }

    get fun intMap4Value(key: Int): SomeStruct? {
        return self.intMap4.get(key);
    }

    get fun intMap5(): map<Int, Address> {
        return self.intMap5;
    }

    get fun intMap5Value(key: Int): Address? {
        return self.intMap5.get(key);
    }

    get fun intMap6_1(): map<Int as int8, Int> {
        return self.intMap6_1;
    }

    get fun intMap6_1Value(key: Int): Int? {
        return self.intMap6_1.get(key);
    }

    get fun intMap6_2(): map<Int as int16, Int> {
        return self.intMap6_2;
    }

    get fun intMap6_2Value(key: Int): Int? {
        return self.intMap6_2.get(key);
    }

    get fun intMap6_3(): map<Int as int32, Int> {
        return self.intMap6_3;
    }

    get fun intMap6_3Value(key: Int): Int? {
        return self.intMap6_3.get(key);
    }

    get fun intMap6_4(): map<Int as int64, Int> {
        return self.intMap6_4;
    }

    get fun intMap6_4Value(key: Int): Int? {
        return self.intMap6_4.get(key);
    }

    get fun intMap6_5(): map<Int as int128, Int> {
        return self.intMap6_5;
    }

    get fun intMap6_5Value(key: Int): Int? {
        return self.intMap6_5.get(key);
    }

    get fun intMap6_6(): map<Int as int256, Int> {
        return self.intMap6_6;
    }

    get fun intMap6_6Value(key: Int): Int? {
        return self.intMap6_6.get(key);
    }

    get fun intMap6_7(): map<Int as int257, Int> {
        return self.intMap6_7;
    }

    get fun intMap6_7Value(key: Int): Int? {
        return self.intMap6_7.get(key);
    }

    get fun intMap7_1(): map<Int as uint8, Int> {
        return self.intMap7_1;
    }

    get fun intMap7_1Value(key: Int): Int? {
        return self.intMap7_1.get(key);
    }

    get fun intMap7_2(): map<Int as uint16, Int> {
        return self.intMap7_2;
    }

    get fun intMap7_2Value(key: Int): Int? {
        return self.intMap7_2.get(key);
    }

    get fun intMap7_3(): map<Int as uint32, Int> {
        return self.intMap7_3;
    }

    get fun intMap7_3Value(key: Int): Int? {
        return self.intMap7_3.get(key);
    }

    get fun intMap7_4(): map<Int as uint64, Int> {
        return self.intMap7_4;
    }

    get fun intMap7_4Value(key: Int): Int? {
        return self.intMap7_4.get(key);
    }

    get fun intMap7_5(): map<Int as uint128, Int> {
        return self.intMap7_5;
    }

    get fun intMap7_5Value(key: Int): Int? {
        return self.intMap7_5.get(key);
    }

    get fun intMap7_6(): map<Int as uint256, Int> {
        return self.intMap7_6;
    }

    get fun intMap7_6Value(key: Int): Int? {
        return self.intMap7_6.get(key);
    }

    get fun intMap8_1(): map<Int, Int as int8> {
        return self.intMap8_1;
    }

    get fun intMap8_1Value(key: Int): Int? {
        return self.intMap8_1.get(key);
    }

    get fun intMap8_2(): map<Int, Int as int16> {
        return self.intMap8_2;
    }

    get fun intMap8_2Value(key: Int): Int? {
        return self.intMap8_2.get(key);
    }

    get fun intMap8_3(): map<Int, Int as int32> {
        return self.intMap8_3;
    }

    get fun intMap8_3Value(key: Int): Int? {
        return self.intMap8_3.get(key);
    }

    get fun intMap8_4(): map<Int, Int as int64> {
        return self.intMap8_4;
    }

    get fun intMap8_4Value(key: Int): Int? {
        return self.intMap8_4.get(key);
    }

    get fun intMap8_5(): map<Int, Int as int128> {
        return self.intMap8_5;
    }

    get fun intMap8_5Value(key: Int): Int? {
        return self.intMap8_5.get(key);
    }

    get fun intMap8_6(): map<Int, Int as int256> {
        return self.intMap8_6;
    }

    get fun intMap8_6Value(key: Int): Int? {
        return self.intMap8_6.get(key);
    }

    get fun intMap8_7(): map<Int, Int as int257> {
        return self.intMap8_7;
    }

    get fun intMap8_7Value(key: Int): Int? {
        return self.intMap8_7.get(key);
    }

    get fun intMap9_1(): map<Int, Int as uint8> {
        return self.intMap9_1;
    }

    get fun intMap9_1Value(key: Int): Int? {
        return self.intMap9_1.get(key);
    }

    get fun intMap9_2(): map<Int, Int as uint16> {
        return self.intMap9_2;
    }

    get fun intMap9_2Value(key: Int): Int? {
        return self.intMap9_2.get(key);
    }

    get fun intMap9_3(): map<Int, Int as uint32> {
        return self.intMap9_3;
    }

    get fun intMap9_3Value(key: Int): Int? {
        return self.intMap9_3.get(key);
    }

    get fun intMap9_4(): map<Int, Int as uint64> {
        return self.intMap9_4;
    }

    get fun intMap9_4Value(key: Int): Int? {
        return self.intMap9_4.get(key);
    }

    get fun intMap9_5(): map<Int, Int as uint128> {
        return self.intMap9_5;
    }

    get fun intMap9_5Value(key: Int): Int? {
        return self.intMap9_5.get(key);
    }

    get fun intMap9_6(): map<Int, Int as uint256> {
        return self.intMap9_6;
    }

    get fun intMap9_6Value(key: Int): Int? {
        return self.intMap9_6.get(key);
    }

    //
    // Int as Key inside the code (not storage)
    //

    get fun intMap10Value(key: Int, value: Int): Int {
        let map1: map<Int as int8, Int> = emptyMap();
        let map2: map<Int as int16, Int> = emptyMap();
        let map3: map<Int as int32, Int> = emptyMap();
        let map4: map<Int as int64, Int> = emptyMap();
        let map5: map<Int as int128, Int> = emptyMap();
        let map6: map<Int as int256, Int> = emptyMap();
        let map7: map<Int as int257, Int> = emptyMap();

        map1.set(key, value);
        map2.set(key, value);
        map3.set(key, value);
        map4.set(key, value);
        map5.set(key, value);
        map6.set(key, value);
        map7.set(key, value);

        let value1: Int = map1.get(key)!!;
        let value2: Int = map2.get(key)!!;
        let value3: Int = map3.get(key)!!;
        let value4: Int = map4.get(key)!!;
        let value5: Int = map5.get(key)!!;
        let value6: Int = map6.get(key)!!;
        let value7: Int = map7.get(key)!!;

        return value1 + value2 + value3 + value4 + value5 + value6 + value7;
    }
    
    get fun intMap11Value(key: Int, value: Int): Int {
        let map1: map<Int as uint8, Int> = emptyMap();
        let map2: map<Int as uint16, Int> = emptyMap();
        let map3: map<Int as uint32, Int> = emptyMap();
        let map4: map<Int as uint64, Int> = emptyMap();
        let map5: map<Int as uint128, Int> = emptyMap();
        let map6: map<Int as uint256, Int> = emptyMap();

        map1.set(key, value);
        map2.set(key, value);
        map3.set(key, value);
        map4.set(key, value);
        map5.set(key, value);
        map6.set(key, value);

        let value1: Int = map1.get(key)!!;
        let value2: Int = map2.get(key)!!;
        let value3: Int = map3.get(key)!!;
        let value4: Int = map4.get(key)!!;
        let value5: Int = map5.get(key)!!;
        let value6: Int = map6.get(key)!!;

        return value1 + value2 + value3 + value4 + value5 + value6;
    }

    get fun intMap12Value(key: Int, value: Int): Int {
        let map1: map<Int, Int as int8> = emptyMap();
        let map2: map<Int, Int as int16> = emptyMap();
        let map3: map<Int, Int as int32> = emptyMap();
        let map4: map<Int, Int as int64> = emptyMap();
        let map5: map<Int, Int as int128> = emptyMap();
        let map6: map<Int, Int as int256> = emptyMap();
        let map7: map<Int, Int as int257> = emptyMap();

        map1.set(key, value);
        map2.set(key, value);
        map3.set(key, value);
        map4.set(key, value);
        map5.set(key, value);
        map6.set(key, value);
        map7.set(key, value);

        let value1: Int = map1.get(key)!!;
        let value2: Int = map2.get(key)!!;
        let value3: Int = map3.get(key)!!;
        let value4: Int = map4.get(key)!!;
        let value5: Int = map5.get(key)!!;
        let value6: Int = map6.get(key)!!;
        let value7: Int = map7.get(key)!!;

        return value1 + value2 + value3 + value4 + value5 + value6 + value7;
    }

    get fun intMap13Value(key: Int, value: Int): Int {
        let map1: map<Int, Int as uint8> = emptyMap();
        let map2: map<Int, Int as uint16> = emptyMap();
        let map3: map<Int, Int as uint32> = emptyMap();
        let map4: map<Int, Int as uint64> = emptyMap();
        let map5: map<Int, Int as uint128> = emptyMap();
        let map6: map<Int, Int as uint256> = emptyMap();
        let map7: map<Int, Int as coins> = emptyMap();

        map1.set(key, value);
        map2.set(key, value);
        map3.set(key, value);
        map4.set(key, value);
        map5.set(key, value);
        map6.set(key, value);
        map7.set(key, value);

        let value1: Int = map1.get(key)!!;
        let value2: Int = map2.get(key)!!;
        let value3: Int = map3.get(key)!!;
        let value4: Int = map4.get(key)!!;
        let value5: Int = map5.get(key)!!;
        let value6: Int = map6.get(key)!!;
        let value7: Int = map7.get(key)!!;
        
        return value1 + value2 + value3 + value4 + value5 + value6 + value7;
    }

    //
    // Address Keys
    //

    addrMap1: map<Address, Int>;
    addrMap2: map<Address, Bool>;
    addrMap3: map<Address, Cell>;
    addrMap4: map<Address, SomeStruct>;
    addrMap5: map<Address, Address>;

    addrMap6_1: map<Address, Int as int8>;
    addrMap6_2: map<Address, Int as int16>;
    addrMap6_3: map<Address, Int as int32>;
    addrMap6_4: map<Address, Int as int64>;
    addrMap6_5: map<Address, Int as int128>;
    addrMap6_6: map<Address, Int as int256>;
    addrMap6_7: map<Address, Int as int257>;

    addrMap7_1: map<Address, Int as uint8>;
    addrMap7_2: map<Address, Int as uint16>;
    addrMap7_3: map<Address, Int as uint32>;
    addrMap7_4: map<Address, Int as uint64>;
    addrMap7_5: map<Address, Int as uint128>;
    addrMap7_6: map<Address, Int as uint256>;

    receive(msg: SetAddrMap1) {
        self.addrMap1.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap2) {
        self.addrMap2.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap3) {
        self.addrMap3.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap4) {
        self.addrMap4.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap5) {
        self.addrMap5.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap6) {
        self.addrMap6_1.set(msg.key, msg.value);
        self.addrMap6_2.set(msg.key, msg.value);
        self.addrMap6_3.set(msg.key, msg.value);
        self.addrMap6_4.set(msg.key, msg.value);
        self.addrMap6_5.set(msg.key, msg.value);
        self.addrMap6_6.set(msg.key, msg.value);
        self.addrMap6_7.set(msg.key, msg.value);
    }

    receive(msg: SetAddrMap7) {
        self.addrMap7_1.set(msg.key, msg.value);
        self.addrMap7_2.set(msg.key, msg.value);
        self.addrMap7_3.set(msg.key, msg.value);
        self.addrMap7_4.set(msg.key, msg.value);
        self.addrMap7_5.set(msg.key, msg.value);
        self.addrMap7_6.set(msg.key, msg.value);
    }

    receive("reset") {
        self.addrMap1 = emptyMap();
        self.addrMap2 = emptyMap();
        self.addrMap3 = emptyMap();
        self.addrMap4 = emptyMap();
        self.addrMap5 = emptyMap();

        self.intMap1 = emptyMap();
        self.intMap2 = emptyMap();
        self.intMap3 = emptyMap();
        self.intMap4 = emptyMap();
        self.intMap5 = emptyMap();
    }

    get fun addrMap1(): map<Address, Int> {
        return self.addrMap1;
    }
    
    get fun addrMap1Value(key: Address): Int? {
        return self.addrMap1.get(key);
    }

    get fun addrMap2(): map<Address, Bool> {
        return self.addrMap2;
    }

    get fun addrMap2Value(key: Address): Bool? {
        return self.addrMap2.get(key);
    }

    get fun addrMap3(): map<Address, Cell> {
        return self.addrMap3;
    }

    get fun addrMap3Value(key: Address): Cell? {
        return self.addrMap3.get(key);
    }

    get fun addrMap4(): map<Address, SomeStruct> {
        return self.addrMap4;
    }

    get fun addrMap4Value(key: Address): SomeStruct? {
        return self.addrMap4.get(key);
    }

    get fun addrMap5(): map<Address, Address> {
        return self.addrMap5;
    }

    get fun addrMap5Value(key: Address): Address? {
        return self.addrMap5.get(key);
    }

    get fun addrMap6_1(): map<Address, Int as int8> {
        return self.addrMap6_1;
    }

    get fun addrMap6_1Value(key: Address): Int? {
        return self.addrMap6_1.get(key);
    }

    get fun addrMap6_2(): map<Address, Int as int16> {
        return self.addrMap6_2;
    }

    get fun addrMap6_2Value(key: Address): Int? {
        return self.addrMap6_2.get(key);
    }

    get fun addrMap6_3(): map<Address, Int as int32> {
        return self.addrMap6_3;
    }

    get fun addrMap6_3Value(key: Address): Int? {
        return self.addrMap6_3.get(key);
    }

    get fun addrMap6_4(): map<Address, Int as int64> {
        return self.addrMap6_4;
    }

    get fun addrMap6_4Value(key: Address): Int? {
        return self.addrMap6_4.get(key);
    }

    get fun addrMap6_5(): map<Address, Int as int128> {
        return self.addrMap6_5;
    }

    get fun addrMap6_5Value(key: Address): Int? {
        return self.addrMap6_5.get(key);
    }

    get fun addrMap6_6(): map<Address, Int as int256> {
        return self.addrMap6_6;
    }

    get fun addrMap6_6Value(key: Address): Int? {
        return self.addrMap6_6.get(key);
    }

    get fun addrMap6_7(): map<Address, Int as int257> {
        return self.addrMap6_7;
    }

    get fun addrMap6_7Value(key: Address): Int? {
        return self.addrMap6_7.get(key);
    }

    get fun addrMap7_1(): map<Address, Int as uint8> {
        return self.addrMap7_1;
    }

    get fun addrMap7_1Value(key: Address): Int? {
        return self.addrMap7_1.get(key);
    }

    get fun addrMap7_2(): map<Address, Int as uint16> {
        return self.addrMap7_2;
    }

    get fun addrMap7_2Value(key: Address): Int? {
        return self.addrMap7_2.get(key);
    }

    get fun addrMap7_3(): map<Address, Int as uint32> {
        return self.addrMap7_3;
    }

    get fun addrMap7_3Value(key: Address): Int? {
        return self.addrMap7_3.get(key);
    }

    get fun addrMap7_4(): map<Address, Int as uint64> {
        return self.addrMap7_4;
    }

    get fun addrMap7_4Value(key: Address): Int? {
        return self.addrMap7_4.get(key);
    }

    get fun addrMap7_5(): map<Address, Int as uint128> {
        return self.addrMap7_5;
    }

    get fun addrMap7_5Value(key: Address): Int? {
        return self.addrMap7_5.get(key);
    }

    get fun addrMap7_6(): map<Address, Int as uint256> {
        return self.addrMap7_6;
    }

    get fun addrMap7_6Value(key: Address): Int? {
        return self.addrMap7_6.get(key);
    }

    get fun mapAsCell(): Cell? {
        return self.addrMap7_6.asCell();
    }
}