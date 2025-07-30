struct DefaultStruct {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "test";
}

contract StructDefaultField {
    field: DefaultStruct;

    init() {
        self.field = DefaultStruct{};
    }
}