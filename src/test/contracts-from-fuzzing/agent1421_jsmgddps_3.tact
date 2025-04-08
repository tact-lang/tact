struct OptionalStringHolder {
    maybeText: String?;
}

struct OptionalIntHolder {
    maybeInt: Int?;
}

contract MultiOptionalFieldsTest {
    optStr: OptionalStringHolder = OptionalStringHolder{maybeText: null};
    optInt: OptionalIntHolder = OptionalIntHolder{maybeInt: null};
}