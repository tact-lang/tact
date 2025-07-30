struct NestedString {
    message: String;
    suffix: String;
}

contract StringInStruct {
    payload: NestedString;

    init() {
        self.payload = NestedString{
            message: "Hello",
            suffix: "World"
        };
    }
}