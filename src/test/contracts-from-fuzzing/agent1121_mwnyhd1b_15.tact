struct Nested {
    value: Int;
}

contract OptionalCompositeFields {
    optStruct: Nested?;
    optString: String?;
    optCell: Cell?;

    init() {
        self.optStruct = null;
        self.optString = null;
        self.optCell = null;
    }
}