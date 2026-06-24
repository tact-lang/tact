struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
}

contract Test {
    record: S;

    init() {
        self.record = S{
            a: 1,
            b: false,
            c: null,
            d: "hi",
            e: true,
        };
    }
}