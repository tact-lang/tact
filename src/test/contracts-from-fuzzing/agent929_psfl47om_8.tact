struct NestedDefault {
    a: Int = 1;
    b: Bool = false;
}

contract OptionalNestedDefault {
    val: NestedDefault?;

    init() {
        self.val = NestedDefault{};
    }
}