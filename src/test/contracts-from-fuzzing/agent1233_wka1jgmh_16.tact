// Struct with mix of optionals and defaults
struct Combo {
    optInt: Int?;
    hasDef: String = "x";
    optBool: Bool?;
    defInt: Int = 2;
    optStr: String?;
}

contract ComboStructStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            optInt: null,
            hasDef: "override",
            optBool: true,
            defInt: 42,
            optStr: null
        };
    }
}