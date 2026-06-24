struct NestedString {
    innerStr: String;
    innerOptional: String?;
}

contract TestContract {
    field1: String;
    field2: String?;
    nested: NestedString;

    init() {
        self.field1 = "abc";
        self.field2 = null;
        self.nested = NestedString{innerStr: "xyz", innerOptional: null};
    }
}