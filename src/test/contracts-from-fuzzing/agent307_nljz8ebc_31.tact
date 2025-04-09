struct Some {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

contract TestOpt {
    store: Some;

    init() {
        self.store = Some {
            a: 9,
            b: null,
            c: "hello",
            d: null,
        };
    }
}