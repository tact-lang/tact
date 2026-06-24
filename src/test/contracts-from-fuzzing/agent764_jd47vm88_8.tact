struct NestedString {
    s1: String;
    s2: String;
    b: Bool;
}

contract StringsNest {
    val: NestedString;

    init() {
        self.val = NestedString{
            s1: "abc",
            s2: "def",
            b: true
        };
    }
}