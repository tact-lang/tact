struct OptionalSerialization {
    i64: Int? as int64;
    u8: Int? as uint8;
    addr: Address?;
    s: String?;
}

contract OptSerialContract {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            i64: null,
            u8: 255,
            addr: myAddress(),
            s: null
        };
    }
}