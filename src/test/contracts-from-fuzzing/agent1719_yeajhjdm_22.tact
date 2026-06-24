struct NestedDefault {
    val: Int = 7;
}

contract NestedDefContract {
    s: NestedDefault;

    init() {
        self.s = NestedDefault{};
    }
}