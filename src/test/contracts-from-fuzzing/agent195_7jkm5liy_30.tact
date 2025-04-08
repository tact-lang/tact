struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: String?;
}

contract Simple {
    field: S;

    init() {
        self.field = S{
            a: 1,
            b: false,
            c: null,
            d: "hello",
            e: null
        };
    }
}
