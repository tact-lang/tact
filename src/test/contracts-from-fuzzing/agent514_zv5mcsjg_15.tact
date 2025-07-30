struct Mix {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: String = "This is a long default string to test size serialization limits inside nested struct.";
}

contract ComplexMix {
    data: Mix = Mix{
        a: null,
        b: true,
        c: "hello",
        d: "Another quite long string inside persistent storage default initialization for nested struct.",
    };

    init() {
        self.data = Mix{
            a: -100,
            b: false,
            c: null,
            d: "Updated value",
        };
    }
}