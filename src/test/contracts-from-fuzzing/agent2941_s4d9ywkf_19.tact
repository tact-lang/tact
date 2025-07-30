struct NestedString {
    s: String;
}

contract DirectNestedString {
    data: NestedString;
    
    init() {
        self.data = NestedString{
            s: "test",
        };
    }
}