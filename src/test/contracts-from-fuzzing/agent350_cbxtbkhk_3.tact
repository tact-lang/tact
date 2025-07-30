struct NestedOptional {
    foo: Int?;
    bar: String?;
}

contract OptionalInStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: null,
            bar: "hello"
        };
    }
}