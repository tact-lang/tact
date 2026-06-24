struct SomeStruct {
    foo: Int;
}

contract NullableStructHolder {
    maybe: SomeStruct?;

    init() {
        self.maybe = null;
    }
}