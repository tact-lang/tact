struct NestedSerial {
    i8: Int as int8;
    u4: Int as uint4;
    normal: Int;
}

contract SerializeStruct {
    s: NestedSerial;

    init() {
        self.s = NestedSerial{i8:-5,u4:8,normal:1000};
    }
}