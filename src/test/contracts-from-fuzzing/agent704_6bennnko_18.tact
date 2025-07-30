struct OptionalStringStruct {
    s: String?;
}

contract OptionalStringStorage {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{s: null};
    }
}