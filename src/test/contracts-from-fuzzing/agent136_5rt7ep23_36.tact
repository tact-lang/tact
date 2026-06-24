struct NestedStrings {
    s1: String;
    s2: String;
}

contract TestStrs {
    f: NestedStrings;

    init() {
        self.f = NestedStrings{
            s1: "Hello",
            s2: "World"
        };
    }
}