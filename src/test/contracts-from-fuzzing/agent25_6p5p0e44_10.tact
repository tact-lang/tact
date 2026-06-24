struct SomeStruct {
    value: Int;
    info: String;
}

contract NullableTopStruct {
    s: SomeStruct?;

    init() {
        self.s = null;
    }
}
