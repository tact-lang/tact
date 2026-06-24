struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract Test {
    s: ManyOptional;

    init() {
        self.s = ManyOptional {
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}