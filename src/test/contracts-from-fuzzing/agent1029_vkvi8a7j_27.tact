struct NestedWithDefaults {
    a: Int = 1;
    nested: NestedInner;
}

struct NestedInner {
    b: String = "b";
    c: Bool = false;
}

contract TestDefaults {
    val: NestedWithDefaults;
    init() {
        self.val = NestedWithDefaults{
            nested: NestedInner{}
        };
    }
}