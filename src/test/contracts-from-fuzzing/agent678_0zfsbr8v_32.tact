struct NestedString {
    content: String;
    comment: String?;
}

contract OptionalStringStruct {
    data: NestedString?;

    init() {
        self.data = NestedString{
            content: "hello",
            comment: null
        };
    }
}