struct StringMix {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract Test {
    data: StringMix;

    init() {
        self.data = StringMix{
            a: "a",
            b: null,
            c: "c",
            d: null
        };
    }
}
