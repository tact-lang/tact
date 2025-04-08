struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{};
    }
}