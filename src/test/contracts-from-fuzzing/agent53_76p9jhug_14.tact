struct Abc {
    x: Int;
}

contract NullableStruct {
    foo: Abc? = null;

    init() {
        self.foo = null;
    }
}