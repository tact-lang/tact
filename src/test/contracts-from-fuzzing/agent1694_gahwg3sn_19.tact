struct NestedDefault {
    x: Int = 42;
    y: Bool = true;
}

contract Defaults {
    val: NestedDefault;

    init() {
        self.val = NestedDefault{};
    }
}