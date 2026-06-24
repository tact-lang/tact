struct DeepNestedOptional {
    foo: Int?;
}

struct DoubleNestedOptional {
    bar: DeepNestedOptional?;
}

contract TestContract {
    qux: DoubleNestedOptional?;
    init() {
        self.qux = DoubleNestedOptional{ bar: null };
    }
}