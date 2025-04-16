struct OptionalStringStruct {
    name: String?;
    description: String?;
}

contract OptionalStringStorage {
    strData: OptionalStringStruct?;

    init() {
        self.strData = null;
    }
}