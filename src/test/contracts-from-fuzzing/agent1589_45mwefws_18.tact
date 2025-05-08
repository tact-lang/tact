struct ComplexOptional {
    inner: Int?;
    nested: NestedSub?;
}

struct NestedSub {
    val: Bool;
}

contract ComplexOptStructInContract {
    cfield: ComplexOptional;

    init() {
        self.cfield = ComplexOptional{ inner: null, nested: null };
    }
}