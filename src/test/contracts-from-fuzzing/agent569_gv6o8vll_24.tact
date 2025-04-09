struct NestedManyDefaults {
    a: Int = 1;
    b: String = "str";
    c: Bool = false;
}

struct OuterDefaults {
    x: Int = 42;
    y: NestedManyDefaults;
}

contract DefNested {
    val: OuterDefaults;
    init() {
        self.val = OuterDefaults{ y: NestedManyDefaults{} };
    }
}