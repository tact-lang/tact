struct StringOptionalStruct {
    val: String?;
}

contract OptionalStringFieldContract {
    data: StringOptionalStruct;

    init() {
        self.data = StringOptionalStruct { val: null };
    }
}