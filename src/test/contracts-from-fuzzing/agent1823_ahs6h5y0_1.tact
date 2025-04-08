struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

contract TestStorage {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            foo: null,
            bar: true
        };
    }
}