struct NestedString {
    s: String;
    t: String?;
}

contract StringStructFields {
    val: NestedString;

    init() {
        self.val = NestedString{
            s: "Hello",
            t: null
        };
    }
}
