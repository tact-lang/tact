struct Boo {
    s: String;
}

contract NullableNestedStruct {
    v: Boo?;

    init() {
        self.v = null;
    }
}
