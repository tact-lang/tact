struct SerializedA {
    a: Int as int64;
    b: Int? as uint32;
    c: Bool?;
}

contract OptAndSerialize {
    data: SerializedA;

    init() {
        self.data = SerializedA{
            a: -123456789,
            b: null,
            c: null,
        };
    }
}