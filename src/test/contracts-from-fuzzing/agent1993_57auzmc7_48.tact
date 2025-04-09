struct NestedOptD {
    s: String? = null;
}

contract WrapNestedOptD {
    n: NestedOptD;

    init() {
        self.n = NestedOptD{};
    }
}