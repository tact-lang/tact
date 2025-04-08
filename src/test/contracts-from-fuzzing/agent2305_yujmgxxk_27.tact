struct Combo {
    s: String;
    b: Bool;
    n: Int;
    o: Int?;
    t: String?;
}

contract TestCombo {
    data: Combo;

    init() {
        self.data = Combo{
            s: "hi",
            b: true,
            n: 10,
            o: null,
            t: null
        };
    }
}
