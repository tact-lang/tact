struct DoubleNestedOptional {
    first: Int?;
    second: Bool?;
}

contract DoubleOptionalTop {
    d1: DoubleNestedOptional?;
    d2: DoubleNestedOptional?;

    init() {
        self.d1 = DoubleNestedOptional{ first: 1, second: null };
        self.d2 = null;
    }
}