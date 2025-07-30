struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Address?
}

contract InitOrder {
    f: Combo;

    init() {
        self.f = Combo {
            c: "hi",
            b: true,
            a: 17,
            d: null
        };
    }
}