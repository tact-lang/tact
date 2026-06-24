struct NestedOptional {
    innerOpt: Inner?;
}

struct Inner {
    val1: Int;
    val2: Bool;
}

contract NestedOptionalField {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ innerOpt: null };
    }
}