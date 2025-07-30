struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: null,
            bar: true,
        };
    }
}