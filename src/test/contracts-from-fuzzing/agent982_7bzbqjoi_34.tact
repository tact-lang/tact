struct Combo {
    i: Int;
    b: Bool;
    s: String;
    ia: Int?;
    sa: String?;
    ba: Bool?;
}

contract ComboContract {
    storage: Combo;

    init() {
        self.storage = Combo{
            i: 9,
            b: true,
            s: "s",
            ia: null,
            sa: null,
            ba: null
        };
    }
}