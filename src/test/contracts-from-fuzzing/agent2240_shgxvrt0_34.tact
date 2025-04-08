struct JustString {
    s: String;
}

contract MultipleNestedString {
    v1: JustString;
    v2: JustString;
    v3: JustString;

    init() {
        self.v1 = JustString{ s: "a" };
        self.v2 = JustString{ s: "b" };
        self.v3 = JustString{ s: "c" };
    }
}