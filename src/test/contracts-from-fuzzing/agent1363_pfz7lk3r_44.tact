struct OptionalStringStruct {
    foo: String?;
}

contract OptionalStringStorage {
    val: OptionalStringStruct;

    init() {
        self.val = OptionalStringStruct{foo: null};
    }
}