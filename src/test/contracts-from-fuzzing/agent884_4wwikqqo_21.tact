struct NestedStrings {
    s1: String;
    s2: String;
}

struct NestedOptional {
    inner: NestedStrings?;
}

contract OptNestedStr {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner:null };
    }
}