struct Wrapper {
    content: String;
}

contract NullableStruct {
    store: Wrapper?;

    init() {
        self.store = null;
    }
}
