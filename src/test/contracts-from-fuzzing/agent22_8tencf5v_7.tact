struct Combo {
    x: Int;
    y: Bool?;
    z: String;
    nested: NestedCombo;
}

struct NestedCombo {
    innerInt: Int;
    innerOpt: String?;
}

contract ComboContract {
    st: Combo;

    init() {
        self.st = Combo{
            x: 5,
            y: null,
            z: "hi",
            nested: NestedCombo{
                innerInt: 99,
                innerOpt: null
            }
        };
    }
}