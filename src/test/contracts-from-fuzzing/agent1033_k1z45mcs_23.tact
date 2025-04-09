struct Combo {
    optInt: Int?;
    strVal: String;
    boolVal: Bool;
}

contract ComboStore {
    record: Combo;

    init() {
        self.record = Combo{
            optInt: 100,
            strVal: "hi",
            boolVal: false
        };
    }
}