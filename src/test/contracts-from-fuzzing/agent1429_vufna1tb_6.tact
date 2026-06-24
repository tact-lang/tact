struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract DeepOptionals {
    data: NestedOptional?;

    init() {
        self.data = NestedOptional{
            foo: null,
            bar: false,
            baz: "ok"
        };
    }
}
