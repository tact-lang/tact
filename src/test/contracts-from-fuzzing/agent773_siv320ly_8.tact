struct NestedString {
    text: String;
    optionalInt: Int?;
}

contract StringStruct {
    data: NestedString;

    init() {
        self.data = NestedString{
            text: "fuzz test",
            optionalInt: null,
        };
    }
}