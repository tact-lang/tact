struct OptionalDeepSerialization {
    a: Int? as uint8;
    b: Int? as int64;
    c: Int? as uint256;
}

contract OptSerializationContract {
    data: OptionalDeepSerialization;

    init() {
        self.data = OptionalDeepSerialization{
            a: null,
            b: null,
            c: null
        };
    }
}