struct StructWithOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestOptionals {
    data: StructWithOptional;
    init() {
        self.data = StructWithOptional{
            foo: null,
            bar: true,
            baz: null
        };
    }
}