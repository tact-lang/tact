struct NestedWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract TestContract {
    nested: NestedWithOptionals;

    init() {
        self.nested = NestedWithOptionals{a: null, b: null, c: null, d: null, e: null};
    }
}