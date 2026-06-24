struct S1 { a: Int; }
struct S2 { b: Bool; }
struct NestedCombo {
    s1: S1;
    s2: S2;
    val: Int;
}

contract ComboFields {
    field: NestedCombo;

    init() {
        self.field = NestedCombo{
            s1: S1{a:1},
            s2: S2{b:true},
            val: 42,
        };
    }
}