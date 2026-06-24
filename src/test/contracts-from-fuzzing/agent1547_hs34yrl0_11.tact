struct S {
    a: Int as int64;
    b: Int as uint128;
    c: Bool;
    d: String;
}

contract SerializationChecks {
    storage: S;

    init() {
        self.storage = S{
            a: -50,
            b: 123456789,
            c: true,
            d: "ok"
        };
    }
}