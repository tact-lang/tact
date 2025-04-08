struct NestedOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int;
}

contract NestedOptionalTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{inner: null};
    }
}