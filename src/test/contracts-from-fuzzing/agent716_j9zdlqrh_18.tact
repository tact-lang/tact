struct NestedDef {
    a: Int = 7;
    b: String = "x";
}

contract WithNestedDef {
    n: NestedDef;

    init() {
        self.n = NestedDef{};
    }
}