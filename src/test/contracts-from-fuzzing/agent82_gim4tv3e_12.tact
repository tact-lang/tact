struct StringAndOptionals {
    a: String;
    b: String?;
    c: Int?;
    d: Bool?;
}

contract Test {
    inner: StringAndOptionals;

    init() {
        self.inner = StringAndOptionals{
            a: "hello",
            b: null,
            c: null,
            d: false,
        };
    }
}
