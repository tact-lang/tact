struct NestedA {
    value: Int?;
}

struct NestedB {
    nested: NestedA?;
}

struct NestedC {
    nested: NestedB?;
}

struct NestedD {
    nested: NestedC?;
}

contract DeepOptionals {
    value: NestedD;

    init() {
        self.value = NestedD{ nested: null };
    }
}