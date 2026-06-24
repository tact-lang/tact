struct Asserialized {
    i4: Int as int4;
    u5: Int as uint5;
    i16: Int as int16;
    u64: Int as uint64;
    i256: Int as int256;
}

contract SerializedVariantsTest {
    data: Asserialized;

    init() {
        self.data = Asserialized{ i4:-2, u5:3, i16:10, u64:20, i256:30 };
    }
}
