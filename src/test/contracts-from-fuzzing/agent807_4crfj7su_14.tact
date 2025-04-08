// contract with intentionally mixing optional and required nested struct fields
struct NestedCombo {
    val: Int;
    optVal: Int?;
}

contract ComboPersist {
    n: NestedCombo;
    str: String?;
    flag: Bool;

    init() {
        self.n = NestedCombo{ val: 5, optVal: null };
        self.str = null;
        self.flag = true;
    }
}