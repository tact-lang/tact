struct NestedWithOptionals {
    x: Int;
    y: Int?;
    s: String?;
}

contract NestedOptionals {
    d: NestedWithOptionals;

    init() {
        self.d = NestedWithOptionals{ x: 1, y: null, s: null };
    }
}