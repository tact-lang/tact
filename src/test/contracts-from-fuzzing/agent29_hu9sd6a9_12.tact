struct OptionalStringStruct {
    s: String?;
    num: Int;
}

contract StructOptionalStrings {
    val: OptionalStringStruct;

    init() {
        self.val = OptionalStringStruct{ s: null, num: 5 };
    }
}