struct SomeStruct {
    foo: Int;
}

contract FieldsInit {
    foo: Int;
    bar: SomeStruct;

    init() {
        self.foo = 1;
        self.bar = SomeStruct{foo: 10};
    }
}