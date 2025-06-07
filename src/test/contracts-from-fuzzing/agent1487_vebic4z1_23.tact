struct NestedDefault {
    x: Int = 5;
    y: Int? = null;
}

contract NestedDefaultContract {
    s: NestedDefault;

    init() {
        self.s = NestedDefault{};
    }
}