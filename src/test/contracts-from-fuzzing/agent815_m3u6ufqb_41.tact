struct NestedDefaultOptions {
    a: Int? = null;
    b: Bool? = null;
}

contract NestedDefaultOptStore {
    d: NestedDefaultOptions;

    init() {
        self.d = NestedDefaultOptions{};
    }
}