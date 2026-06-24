struct NestedDefault {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
}

contract NestedDefaultsContract {
    n: NestedDefault;

    init() {
        self.n = NestedDefault{};
    }
}