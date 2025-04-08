struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract TestMix {
    store: Mix?;
    init() {
        self.store = Mix{
            a: 10,
            b: null,
            c: "mix",
            d: null
        };
    }
}