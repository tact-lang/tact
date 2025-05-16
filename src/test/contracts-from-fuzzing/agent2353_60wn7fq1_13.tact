struct NestedStrings {
    s1: String;
    s2: String?;
}

contract StringFields {
    a: String;
    b: String?;
    c: NestedStrings;

    init() {
        self.a = "hello";
        self.b = null;
        self.c = NestedStrings{ s1: "hi", s2: null };
    }
}