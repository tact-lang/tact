struct StringOpt {
    field1: String?;
    field2: String?;
}

contract OptionalStrings {
    val: StringOpt;

    init() {
        self.val = StringOpt{ field1: null, field2: null };
    }
}