struct Combo {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
}

contract OptAll {
    data: Combo;

    init() {
        self.data = Combo{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}