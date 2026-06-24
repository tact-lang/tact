struct NestedDefault {
    x: Int = 10;
    y: Bool = true;
}

contract DefaultInitialization {
    val: NestedDefault;

    init() {
        self.val = NestedDefault{};
    }
}