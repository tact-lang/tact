struct NestedOptional {
    inner1: Int?;
    inner2: Bool?;
}

contract TestContract {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            inner1: null,
            inner2: true,
        };
    }
}