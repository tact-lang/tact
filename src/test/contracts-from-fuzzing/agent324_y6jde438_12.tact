struct NestedString {
    s1: String;
    s2: String?;
}

contract OptionalStringStruct {
    s: NestedString?;
    fixed: Int;

    init() {
        self.s = NestedString{s1:"hello", s2:null};
        self.fixed = 1;
    }
}