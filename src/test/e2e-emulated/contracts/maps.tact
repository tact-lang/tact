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

message SetUIntMap10 {
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

message DelIntMap1 {
    key: Int;
}

message DelIntMap2 {
    key: Int;
}

message DelIntMap3 {
    key: Int;
}

message DelIntMap4 {
    key: Int;
}

message DelIntMap5 {
    key: Int;
}

message DelIntMap6 {
    key: Int;
}

message DelUIntMap7 {
    key: Int;
}

message DelIntMap8 {
    key: Int;
}

message DelUIntMap9 {
    key: Int;
}

message DelUIntMap10 {
    key: Int;
}

message DelAddrMap1 {
    key: Address;
}

message DelAddrMap2 {
    key: Address;
}

message DelAddrMap3 {
    key: Address;
}

message DelAddrMap4 {
    key: Address;
}

message DelAddrMap5 {
    key: Address;
}

message DelAddrMap6 {
    key: Address;
}

message DelAddrMap7 {
    key: Address;
}

message CheckNullReference {}

message ReplaceIntMap1 {
    key: Int;
    value: Int?;
}

message ReplaceIntMap2 {
    key: Int;
    value: Bool?;
}

message ReplaceIntMap3 {
    key: Int;
    value: Cell?;
}

message ReplaceIntMap4 {
    key: Int;
    value: SomeStruct?;
}

message ReplaceIntMap5 {
    key: Int;
    value: Address?;
}

message ReplaceIntMap6 {
    key: Int;
    value: Int?;
}

message ReplaceUIntMap7 {
    key: Int;
    value: Int?;
}

message ReplaceIntMap8 {
    key: Int;
    value: Int?;
}

message ReplaceUIntMap9 {
    key: Int;
    value: Int?;
}

message ReplaceUIntMap10 {
    key: Int;
    value: Int?;
}

message ReplaceAddrMap1 {
    key: Address;
    value: Int?;
}

message ReplaceAddrMap2 {
    key: Address;
    value: Bool?;
}

message ReplaceAddrMap3 {
    key: Address;
    value: Cell?;
}

message ReplaceAddrMap4 {
    key: Address;
    value: SomeStruct?;
}

message ReplaceAddrMap5 {
    key: Address;
    value: Address?;
}

message ReplaceAddrMap6 {
    key: Address;
    value: Int?;
}

message ReplaceAddrMap7 {
    key: Address;
    value: Int?;
}

message ReplaceGetIntMap1 {
    key: Int;
    value: Int?;
}

message ReplaceGetIntMap2 {
    key: Int;
    value: Bool?;
}

message ReplaceGetIntMap3 {
    key: Int;
    value: Cell?;
}

message ReplaceGetIntMap4 {
    key: Int;
    value: SomeStruct?;
}

message ReplaceGetIntMap5 {
    key: Int;
    value: Address?;
}

message ReplaceGetIntMap6 {
    key: Int;
    value: Int?;
}

message ReplaceGetUIntMap7 {
    key: Int;
    value: Int?;
}

message ReplaceGetIntMap8 {
    key: Int;
    value: Int?;
}

message ReplaceGetUIntMap9 {
    key: Int;
    value: Int?;
}

message ReplaceGetUIntMap10 {
    key: Int;
    value: Int?;
}

message ReplaceGetAddrMap1 {
    key: Address;
    value: Int?;
}

message ReplaceGetAddrMap2 {
    key: Address;
    value: Bool?;
}

message ReplaceGetAddrMap3 {
    key: Address;
    value: Cell?;
}

message ReplaceGetAddrMap4 {
    key: Address;
    value: SomeStruct?;
}

message ReplaceGetAddrMap5 {
    key: Address;
    value: Address?;
}

message ReplaceGetAddrMap6 {
    key: Address;
    value: Int?;
}

message ReplaceGetAddrMap7 {
    key: Address;
    value: Int?;
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

    intMap10_1: map<Int as int42, Int as int27>;
    intMap10_2: map<Int as int29, Int as uint31>;
    intMap10_3: map<Int as uint33, Int as int34>;
    intMap10_4: map<Int as uint35, Int as uint36>;

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

    receive(msg: SetUIntMap10) {
        self.intMap10_1.set(msg.key, msg.value);
        self.intMap10_2.set(msg.key, msg.value);
        self.intMap10_3.set(msg.key, msg.value);
        self.intMap10_4.set(msg.key, msg.value);
    }

    receive(msg: DelIntMap1) {
        self.intMap1.del(msg.key);
    }

    receive(msg: DelIntMap2) {
        self.intMap2.del(msg.key);
    }

    receive(msg: DelIntMap3) {
        self.intMap3.del(msg.key);
    }

    receive(msg: DelIntMap4) {
        self.intMap4.del(msg.key);
    }

    receive(msg: DelIntMap5) {
        self.intMap5.del(msg.key);
    }

    receive(msg: DelIntMap6) {
        self.intMap6_1.del(msg.key);
        self.intMap6_2.del(msg.key);
        self.intMap6_3.del(msg.key);
        self.intMap6_4.del(msg.key);
        self.intMap6_5.del(msg.key);
        self.intMap6_6.del(msg.key);
        self.intMap6_6.del(msg.key);
        self.intMap6_7.del(msg.key);
    }

    receive(msg: DelUIntMap7) {
        self.intMap7_1.del(msg.key);
        self.intMap7_2.del(msg.key);
        self.intMap7_3.del(msg.key);
        self.intMap7_4.del(msg.key);
        self.intMap7_5.del(msg.key);
        self.intMap7_6.del(msg.key);
    }

    receive(msg: DelIntMap8) {
        self.intMap8_1.del(msg.key);
        self.intMap8_2.del(msg.key);
        self.intMap8_3.del(msg.key);
        self.intMap8_4.del(msg.key);
        self.intMap8_5.del(msg.key);
        self.intMap8_6.del(msg.key);
        self.intMap8_7.del(msg.key);
    }

    receive(msg: DelUIntMap9) {
        self.intMap9_1.del(msg.key);
        self.intMap9_2.del(msg.key);
        self.intMap9_3.del(msg.key);
        self.intMap9_4.del(msg.key);
        self.intMap9_5.del(msg.key);
        self.intMap9_6.del(msg.key);
    }

    receive(msg: DelUIntMap10) {
        self.intMap10_1.del(msg.key);
        self.intMap10_2.del(msg.key);
        self.intMap10_3.del(msg.key);
        self.intMap10_4.del(msg.key);
    }

    receive(msg: ReplaceIntMap1) {
        self.intMap1.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceIntMap2) {
        self.intMap2.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceIntMap3) {
        self.intMap3.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceIntMap4) {
        self.intMap4.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceIntMap5) {
        self.intMap5.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceIntMap6) {
        self.intMap6_1.replace(msg.key, msg.value);
        self.intMap6_2.replace(msg.key, msg.value);
        self.intMap6_3.replace(msg.key, msg.value);
        self.intMap6_4.replace(msg.key, msg.value);
        self.intMap6_5.replace(msg.key, msg.value);
        self.intMap6_6.replace(msg.key, msg.value);
        self.intMap6_7.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceUIntMap7) {
        self.intMap7_1.replace(msg.key, msg.value);
        self.intMap7_2.replace(msg.key, msg.value);
        self.intMap7_3.replace(msg.key, msg.value);
        self.intMap7_4.replace(msg.key, msg.value);
        self.intMap7_5.replace(msg.key, msg.value);
        self.intMap7_6.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceIntMap8) {
        self.intMap8_1.replace(msg.key, msg.value);
        self.intMap8_2.replace(msg.key, msg.value);
        self.intMap8_3.replace(msg.key, msg.value);
        self.intMap8_4.replace(msg.key, msg.value);
        self.intMap8_5.replace(msg.key, msg.value);
        self.intMap8_6.replace(msg.key, msg.value);
        self.intMap8_7.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceUIntMap9) {
        self.intMap9_1.replace(msg.key, msg.value);
        self.intMap9_2.replace(msg.key, msg.value);
        self.intMap9_3.replace(msg.key, msg.value);
        self.intMap9_4.replace(msg.key, msg.value);
        self.intMap9_5.replace(msg.key, msg.value);
        self.intMap9_6.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceUIntMap10) {
        self.intMap10_1.replace(msg.key, msg.value);
        self.intMap10_2.replace(msg.key, msg.value);
        self.intMap10_3.replace(msg.key, msg.value);
        self.intMap10_4.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap1) {
        self.intMap1.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap2) {
        self.intMap2.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap3) {
        self.intMap3.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap4) {
        self.intMap4.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap5) {
        self.intMap5.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap6) {
        self.intMap6_1.replaceGet(msg.key, msg.value);
        self.intMap6_2.replaceGet(msg.key, msg.value);
        self.intMap6_3.replaceGet(msg.key, msg.value);
        self.intMap6_4.replaceGet(msg.key, msg.value);
        self.intMap6_5.replaceGet(msg.key, msg.value);
        self.intMap6_6.replaceGet(msg.key, msg.value);
        self.intMap6_7.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetUIntMap7) {
        self.intMap7_1.replaceGet(msg.key, msg.value);
        self.intMap7_2.replaceGet(msg.key, msg.value);
        self.intMap7_3.replaceGet(msg.key, msg.value);
        self.intMap7_4.replaceGet(msg.key, msg.value);
        self.intMap7_5.replaceGet(msg.key, msg.value);
        self.intMap7_6.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetIntMap8) {
        self.intMap8_1.replaceGet(msg.key, msg.value);
        self.intMap8_2.replaceGet(msg.key, msg.value);
        self.intMap8_3.replaceGet(msg.key, msg.value);
        self.intMap8_4.replaceGet(msg.key, msg.value);
        self.intMap8_5.replaceGet(msg.key, msg.value);
        self.intMap8_6.replaceGet(msg.key, msg.value);
        self.intMap8_7.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetUIntMap9) {
        self.intMap9_1.replaceGet(msg.key, msg.value);
        self.intMap9_2.replaceGet(msg.key, msg.value);
        self.intMap9_3.replaceGet(msg.key, msg.value);
        self.intMap9_4.replaceGet(msg.key, msg.value);
        self.intMap9_5.replaceGet(msg.key, msg.value);
        self.intMap9_6.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetUIntMap10) {
        self.intMap10_1.replaceGet(msg.key, msg.value);
        self.intMap10_2.replaceGet(msg.key, msg.value);
        self.intMap10_3.replaceGet(msg.key, msg.value);
        self.intMap10_4.replaceGet(msg.key, msg.value);
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

    get fun intMap10_1(): map<Int as int42, Int as int27> {
        return self.intMap10_1;
    }

    get fun intMap10_1Value(key: Int): Int? {
        return self.intMap10_1.get(key);
    }

    get fun intMap10_2(): map<Int as int29, Int as uint31> {
        return self.intMap10_2;
    }

    get fun intMap10_2Value(key: Int): Int? {
        return self.intMap10_2.get(key);
    }

    get fun intMap10_3(): map<Int as uint33, Int as int34> {
        return self.intMap10_3;
    }

    get fun intMap10_3Value(key: Int): Int? {
        return self.intMap10_3.get(key);
    }

    get fun intMap10_4(): map<Int as uint35, Int as uint36> {
        return self.intMap10_4;
    }

    get fun intMap10_4Value(key: Int): Int? {
        return self.intMap10_4.get(key);
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

    get fun intMap14Value(key: Int, value: Int): Int {
        let map1: map<Int as int42, Int as int27> = emptyMap();
        let map2: map<Int as int29, Int as uint31> = emptyMap();
        let map3: map<Int as uint33, Int as int34> = emptyMap();
        let map4: map<Int as uint35, Int as uint36> = emptyMap();

        map1.set(key, value);
        map2.set(key, value);
        map3.set(key, value);
        map4.set(key, value);

        let value1: Int = map1.get(key)!!;
        let value2: Int = map2.get(key)!!;
        let value3: Int = map3.get(key)!!;
        let value4: Int = map4.get(key)!!;

        return value1 + value2 + value3 + value4;
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

    receive(msg: DelAddrMap1) {
        self.addrMap1.del(msg.key);
    }

    receive(msg: DelAddrMap2) {
        self.addrMap2.del(msg.key);
    }

    receive(msg: DelAddrMap3) {
        self.addrMap3.del(msg.key);
    }

    receive(msg: DelAddrMap4) {
        self.addrMap4.del(msg.key);
    }

    receive(msg: DelAddrMap5) {
        self.addrMap5.del(msg.key);
    }

    receive(msg: DelAddrMap6) {
        self.addrMap6_1.del(msg.key);
        self.addrMap6_2.del(msg.key);
        self.addrMap6_3.del(msg.key);
        self.addrMap6_4.del(msg.key);
        self.addrMap6_5.del(msg.key);
        self.addrMap6_6.del(msg.key);
        self.addrMap6_7.del(msg.key);
    }

    receive(msg: DelAddrMap7) {
        self.addrMap7_1.del(msg.key);
        self.addrMap7_2.del(msg.key);
        self.addrMap7_3.del(msg.key);
        self.addrMap7_4.del(msg.key);
        self.addrMap7_5.del(msg.key);
        self.addrMap7_6.del(msg.key);
    }

    receive(msg: ReplaceAddrMap1) {
        self.addrMap1.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceAddrMap2) {
        self.addrMap2.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceAddrMap3) {
        self.addrMap3.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceAddrMap4) {
        self.addrMap4.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceAddrMap5) {
        self.addrMap5.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceAddrMap6) {
        self.addrMap6_1.replace(msg.key, msg.value);
        self.addrMap6_2.replace(msg.key, msg.value);
        self.addrMap6_3.replace(msg.key, msg.value);
        self.addrMap6_4.replace(msg.key, msg.value);
        self.addrMap6_5.replace(msg.key, msg.value);
        self.addrMap6_6.replace(msg.key, msg.value);
        self.addrMap6_7.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceAddrMap7) {
        self.addrMap7_1.replace(msg.key, msg.value);
        self.addrMap7_2.replace(msg.key, msg.value);
        self.addrMap7_3.replace(msg.key, msg.value);
        self.addrMap7_4.replace(msg.key, msg.value);
        self.addrMap7_5.replace(msg.key, msg.value);
        self.addrMap7_6.replace(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap1) {
        self.addrMap1.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap2) {
        self.addrMap2.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap3) {
        self.addrMap3.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap4) {
        self.addrMap4.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap5) {
        self.addrMap5.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap6) {
        self.addrMap6_1.replaceGet(msg.key, msg.value);
        self.addrMap6_2.replaceGet(msg.key, msg.value);
        self.addrMap6_3.replaceGet(msg.key, msg.value);
        self.addrMap6_4.replaceGet(msg.key, msg.value);
        self.addrMap6_5.replaceGet(msg.key, msg.value);
        self.addrMap6_6.replaceGet(msg.key, msg.value);
        self.addrMap6_7.replaceGet(msg.key, msg.value);
    }

    receive(msg: ReplaceGetAddrMap7) {
        self.addrMap7_1.replaceGet(msg.key, msg.value);
        self.addrMap7_2.replaceGet(msg.key, msg.value);
        self.addrMap7_3.replaceGet(msg.key, msg.value);
        self.addrMap7_4.replaceGet(msg.key, msg.value);
        self.addrMap7_5.replaceGet(msg.key, msg.value);
        self.addrMap7_6.replaceGet(msg.key, msg.value);
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

    get fun intMap1IsEmpty(): Bool {
        return self.intMap1.isEmpty();
    }

    get fun intMap1Del(key: Int): Bool {
        return self.intMap1.del(key);
    }

    // For intMap1: map<Int, Int>
    get fun intMap1Replace(key: Int, value: Int?): Bool {
        return self.intMap1.replace(key, value);
    }

    get fun intMap1ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap1.replaceGet(key, value);
    }

    // For intMap2: map<Int, Bool>
    get fun intMap2Replace(key: Int, value: Bool?): Bool {
        return self.intMap2.replace(key, value);
    }

    get fun intMap2ReplaceGet(key: Int, value: Bool?): Bool? {
        return self.intMap2.replaceGet(key, value);
    }

    // For intMap3: map<Int, Cell>
    get fun intMap3Replace(key: Int, value: Cell?): Bool {
        return self.intMap3.replace(key, value);
    }

    get fun intMap3ReplaceGet(key: Int, value: Cell?): Cell? {
        return self.intMap3.replaceGet(key, value);
    }

    // For intMap4: map<Int, SomeStruct>
    get fun intMap4Replace(key: Int, value: SomeStruct?): Bool {
        return self.intMap4.replace(key, value);
    }

    get fun intMap4ReplaceGet(key: Int, value: SomeStruct?): SomeStruct? {
        return self.intMap4.replaceGet(key, value);
    }

    // For intMap5: map<Int, Address>
    get fun intMap5Replace(key: Int, value: Address?): Bool {
        return self.intMap5.replace(key, value);
    }

    get fun intMap5ReplaceGet(key: Int, value: Address?): Address? {
        return self.intMap5.replaceGet(key, value);
    }

    // For intMap6_1: map<Int as int8, Int>
    get fun intMap6_1Replace(key: Int, value: Int?): Bool {
        return self.intMap6_1.replace(key, value);
    }

    get fun intMap6_1ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_1.replaceGet(key, value);
    }

    // For intMap6_2: map<Int as int16, Int>
    get fun intMap6_2Replace(key: Int, value: Int?): Bool {
        return self.intMap6_2.replace(key, value);
    }

    get fun intMap6_2ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_2.replaceGet(key, value);
    }

    // For intMap6_3: map<Int as int32, Int>
    get fun intMap6_3Replace(key: Int, value: Int?): Bool {
        return self.intMap6_3.replace(key, value);
    }

    get fun intMap6_3ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_3.replaceGet(key, value);
    }

    // For intMap6_4: map<Int as int64, Int>
    get fun intMap6_4Replace(key: Int, value: Int?): Bool {
        return self.intMap6_4.replace(key, value);
    }

    get fun intMap6_4ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_4.replaceGet(key, value);
    }

    // For intMap6_5: map<Int as int128, Int>
    get fun intMap6_5Replace(key: Int, value: Int?): Bool {
        return self.intMap6_5.replace(key, value);
    }

    get fun intMap6_5ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_5.replaceGet(key, value);
    }

    // For intMap6_6: map<Int as int256, Int>
    get fun intMap6_6Replace(key: Int, value: Int?): Bool {
        return self.intMap6_6.replace(key, value);
    }

    get fun intMap6_6ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_6.replaceGet(key, value);
    }

    // For intMap6_7: map<Int as int257, Int>
    get fun intMap6_7Replace(key: Int, value: Int?): Bool {
        return self.intMap6_7.replace(key, value);
    }

    get fun intMap6_7ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap6_7.replaceGet(key, value);
    }

    // For intMap7_1: map<Int as uint8, Int>
    get fun intMap7_1Replace(key: Int, value: Int?): Bool {
        return self.intMap7_1.replace(key, value);
    }

    get fun intMap7_1ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap7_1.replaceGet(key, value);
    }

    // For intMap7_2: map<Int as uint16, Int>
    get fun intMap7_2Replace(key: Int, value: Int?): Bool {
        return self.intMap7_2.replace(key, value);
    }

    get fun intMap7_2ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap7_2.replaceGet(key, value);
    }

    // For intMap7_3: map<Int as uint32, Int>
    get fun intMap7_3Replace(key: Int, value: Int?): Bool {
        return self.intMap7_3.replace(key, value);
    }

    get fun intMap7_3ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap7_3.replaceGet(key, value);
    }

    // For intMap7_4: map<Int as uint64, Int>
    get fun intMap7_4Replace(key: Int, value: Int?): Bool {
        return self.intMap7_4.replace(key, value);
    }

    get fun intMap7_4ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap7_4.replaceGet(key, value);
    }

    // For intMap7_5: map<Int as uint128, Int>
    get fun intMap7_5Replace(key: Int, value: Int?): Bool {
        return self.intMap7_5.replace(key, value);
    }

    get fun intMap7_5ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap7_5.replaceGet(key, value);
    }

    // For intMap7_6: map<Int as uint256, Int>
    get fun intMap7_6Replace(key: Int, value: Int?): Bool {
        return self.intMap7_6.replace(key, value);
    }

    get fun intMap7_6ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap7_6.replaceGet(key, value);
    }

    // For intMap8_1: map<Int, Int as int8>
    get fun intMap8_1Replace(key: Int, value: Int?): Bool {
        return self.intMap8_1.replace(key, value);
    }

    get fun intMap8_1ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_1.replaceGet(key, value);
    }

    // For intMap8_2: map<Int, Int as int16>
    get fun intMap8_2Replace(key: Int, value: Int?): Bool {
        return self.intMap8_2.replace(key, value);
    }

    get fun intMap8_2ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_2.replaceGet(key, value);
    }

    // For intMap8_3: map<Int, Int as int32>
    get fun intMap8_3Replace(key: Int, value: Int?): Bool {
        return self.intMap8_3.replace(key, value);
    }

    get fun intMap8_3ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_3.replaceGet(key, value);
    }

    // For intMap8_4: map<Int, Int as int64>
    get fun intMap8_4Replace(key: Int, value: Int?): Bool {
        return self.intMap8_4.replace(key, value);
    }

    get fun intMap8_4ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_4.replaceGet(key, value);
    }

    // For intMap8_5: map<Int, Int as int128>
    get fun intMap8_5Replace(key: Int, value: Int?): Bool {
        return self.intMap8_5.replace(key, value);
    }

    // this getter used to collide with intMap6_3 so we specified another method_id manually here to avoid that
    get(100000) fun intMap8_5ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_5.replaceGet(key, value);
    }

    // For intMap8_6: map<Int, Int as int256>
    get fun intMap8_6Replace(key: Int, value: Int?): Bool {
        return self.intMap8_6.replace(key, value);
    }

    get fun intMap8_6ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_6.replaceGet(key, value);
    }

    // For intMap8_7: map<Int, Int as int257>
    get fun intMap8_7Replace(key: Int, value: Int?): Bool {
        return self.intMap8_7.replace(key, value);
    }

    get fun intMap8_7ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap8_7.replaceGet(key, value);
    }

    // For intMap9_1: map<Int, Int as uint8>
    get fun intMap9_1Replace(key: Int, value: Int?): Bool {
        return self.intMap9_1.replace(key, value);
    }

    get fun intMap9_1ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap9_1.replaceGet(key, value);
    }

    // For intMap9_2: map<Int, Int as uint16>
    get fun intMap9_2Replace(key: Int, value: Int?): Bool {
        return self.intMap9_2.replace(key, value);
    }

    get fun intMap9_2ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap9_2.replaceGet(key, value);
    }

    // For intMap9_3: map<Int, Int as uint32>
    get fun intMap9_3Replace(key: Int, value: Int?): Bool {
        return self.intMap9_3.replace(key, value);
    }

    get fun intMap9_3ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap9_3.replaceGet(key, value);
    }

    // For intMap9_4: map<Int, Int as uint64>
    get fun intMap9_4Replace(key: Int, value: Int?): Bool {
        return self.intMap9_4.replace(key, value);
    }

    get fun intMap9_4ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap9_4.replaceGet(key, value);
    }

    // For intMap9_5: map<Int, Int as uint128>
    get fun intMap9_5Replace(key: Int, value: Int?): Bool {
        return self.intMap9_5.replace(key, value);
    }

    get fun intMap9_5ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap9_5.replaceGet(key, value);
    }

    // For intMap9_6: map<Int, Int as uint256>
    get fun intMap9_6Replace(key: Int, value: Int?): Bool {
        return self.intMap9_6.replace(key, value);
    }

    get fun intMap9_6ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap9_6.replaceGet(key, value);
    }

    // For intMap10_1: map<Int as int42, Int as int27>
    get fun intMap10_1Replace(key: Int, value: Int?): Bool {
        return self.intMap10_1.replace(key, value);
    }

    get fun intMap10_1ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap10_1.replaceGet(key, value);
    }

    // For intMap10_2: map<Int as int29, Int as uint31>
    get fun intMap10_2Replace(key: Int, value: Int?): Bool {
        return self.intMap10_2.replace(key, value);
    }

    get fun intMap10_2ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap10_2.replaceGet(key, value);
    }

    // For intMap10_3: map<Int as uint33, Int as int34>
    get fun intMap10_3Replace(key: Int, value: Int?): Bool {
        return self.intMap10_3.replace(key, value);
    }

    get fun intMap10_3ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap10_3.replaceGet(key, value);
    }

    // For intMap10_4: map<Int as uint35, Int as uint36>
    get fun intMap10_4Replace(key: Int, value: Int?): Bool {
        return self.intMap10_4.replace(key, value);
    }

    get fun intMap10_4ReplaceGet(key: Int, value: Int?): Int? {
        return self.intMap10_4.replaceGet(key, value);
    }

    //
    // Address Maps Replace and ReplaceGet Functions
    //

    // For addrMap1: map<Address, Int>
    get fun addrMap1Replace(key: Address, value: Int?): Bool {
        return self.addrMap1.replace(key, value);
    }

    get fun addrMap1ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap1.replaceGet(key, value);
    }

    // For addrMap2: map<Address, Bool>
    get fun addrMap2Replace(key: Address, value: Bool?): Bool {
        return self.addrMap2.replace(key, value);
    }

    get fun addrMap2ReplaceGet(key: Address, value: Bool?): Bool? {
        return self.addrMap2.replaceGet(key, value);
    }

    // For addrMap3: map<Address, Cell>
    get fun addrMap3Replace(key: Address, value: Cell?): Bool {
        return self.addrMap3.replace(key, value);
    }

    get fun addrMap3ReplaceGet(key: Address, value: Cell?): Cell? {
        return self.addrMap3.replaceGet(key, value);
    }

    // For addrMap4: map<Address, SomeStruct>
    get fun addrMap4Replace(key: Address, value: SomeStruct?): Bool {
        return self.addrMap4.replace(key, value);
    }

    get fun addrMap4ReplaceGet(key: Address, value: SomeStruct?): SomeStruct? {
        return self.addrMap4.replaceGet(key, value);
    }

    // For addrMap5: map<Address, Address>
    get fun addrMap5Replace(key: Address, value: Address?): Bool {
        return self.addrMap5.replace(key, value);
    }

    get fun addrMap5ReplaceGet(key: Address, value: Address?): Address? {
        return self.addrMap5.replaceGet(key, value);
    }

    // For addrMap6_1: map<Address, Int as int8>
    get fun addrMap6_1Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_1.replace(key, value);
    }

    get fun addrMap6_1ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_1.replaceGet(key, value);
    }

    // For addrMap6_2: map<Address, Int as int16>
    get fun addrMap6_2Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_2.replace(key, value);
    }

    get fun addrMap6_2ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_2.replaceGet(key, value);
    }

    // For addrMap6_3: map<Address, Int as int32>
    get fun addrMap6_3Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_3.replace(key, value);
    }

    get fun addrMap6_3ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_3.replaceGet(key, value);
    }

    // For addrMap6_4: map<Address, Int as int64>
    get fun addrMap6_4Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_4.replace(key, value);
    }

    get fun addrMap6_4ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_4.replaceGet(key, value);
    }

    // For addrMap6_5: map<Address, Int as int128>
    get fun addrMap6_5Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_5.replace(key, value);
    }

    get fun addrMap6_5ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_5.replaceGet(key, value);
    }

    // For addrMap6_6: map<Address, Int as int256>
    get fun addrMap6_6Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_6.replace(key, value);
    }

    get fun addrMap6_6ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_6.replaceGet(key, value);
    }

    // For addrMap6_7: map<Address, Int as int257>
    get fun addrMap6_7Replace(key: Address, value: Int?): Bool {
        return self.addrMap6_7.replace(key, value);
    }

    get fun addrMap6_7ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap6_7.replaceGet(key, value);
    }

    // For addrMap7_1: map<Address, Int as uint8>
    get fun addrMap7_1Replace(key: Address, value: Int?): Bool {
        return self.addrMap7_1.replace(key, value);
    }

    get fun addrMap7_1ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap7_1.replaceGet(key, value);
    }

    // For addrMap7_2: map<Address, Int as uint16>
    get fun addrMap7_2Replace(key: Address, value: Int?): Bool {
        return self.addrMap7_2.replace(key, value);
    }

    get fun addrMap7_2ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap7_2.replaceGet(key, value);
    }

    // For addrMap7_3: map<Address, Int as uint32>
    get fun addrMap7_3Replace(key: Address, value: Int?): Bool {
        return self.addrMap7_3.replace(key, value);
    }

    get fun addrMap7_3ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap7_3.replaceGet(key, value);
    }

    // For addrMap7_4: map<Address, Int as uint64>
    get fun addrMap7_4Replace(key: Address, value: Int?): Bool {
        return self.addrMap7_4.replace(key, value);
    }

    get fun addrMap7_4ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap7_4.replaceGet(key, value);
    }

    // For addrMap7_5: map<Address, Int as uint128>
    get fun addrMap7_5Replace(key: Address, value: Int?): Bool {
        return self.addrMap7_5.replace(key, value);
    }

    get fun addrMap7_5ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap7_5.replaceGet(key, value);
    }

    // For addrMap7_6: map<Address, Int as uint256>
    get fun addrMap7_6Replace(key: Address, value: Int?): Bool {
        return self.addrMap7_6.replace(key, value);
    }

    get fun addrMap7_6ReplaceGet(key: Address, value: Int?): Int? {
        return self.addrMap7_6.replaceGet(key, value);
    }

    get fun checkNullReference(): Int {
        let m: map<Int, Int> = emptyMap();
        return m.get(0)!!;
    }

    receive(msg: CheckNullReference) {
        let m: map<Int, Int> = emptyMap();
        m.get(0)!!;
    }
    
    get fun intMap1Exists(key: Int): Bool {
        return self.intMap1.exists(key);
    }

    get fun intMap2Exists(key: Int): Bool {
        return self.intMap2.exists(key);
    }

    get fun intMap3Exists(key: Int): Bool {
        return self.intMap3.exists(key);
    }

    get fun intMap4Exists(key: Int): Bool {
        return self.intMap4.exists(key);
    }

    get fun intMap5Exists(key: Int): Bool {
        return self.intMap5.exists(key);
    }

    get fun addrMap1Exists(key: Address): Bool {
        return self.addrMap1.exists(key);
    }

    get fun addrMap2Exists(key: Address): Bool {
        return self.addrMap2.exists(key);
    }

    get fun addrMap3Exists(key: Address): Bool {
        return self.addrMap3.exists(key);
    }

    get fun addrMap4Exists(key: Address): Bool {
        return self.addrMap4.exists(key);
    }

    get fun addrMap5Exists(key: Address): Bool {
        return self.addrMap5.exists(key);
    }
}
