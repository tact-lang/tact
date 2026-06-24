struct NestedDefault {
    x: Int = 5;
    y: Bool = false;
}

contract DefaultVals {
    val: NestedDefault;

    init() {
        self.val = NestedDefault{};
    }
}