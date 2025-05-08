struct TinySerialized {
    flag: Bool;
    value: Int as uint2;
}

contract TinyFields {
    s: TinySerialized;

    init() {
        self.s = TinySerialized{
            flag: true,
            value: 3,
        };
    }
}
