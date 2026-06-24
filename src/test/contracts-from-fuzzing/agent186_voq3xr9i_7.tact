struct Combo {
    i: Int;
    s: String;
    b: Bool;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract ComboUse {
    store: Combo;

    init() {
        self.store = Combo{
            i: 5,
            s: "s",
            b: false,
            optI: null,
            optS: "hello",
            optB: null
        };
    }
}