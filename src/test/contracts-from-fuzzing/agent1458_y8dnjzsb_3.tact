struct Diverse {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    stuff: Diverse;

    init() {
        self.stuff = Diverse{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hello",
        };
    }
}