struct NestedStrings {
    s1: String;
    s2: String;
}

struct Outer {
    n1: NestedStrings;
    n2: NestedStrings;
}

contract TestNestedStrings {
    data: Outer;

    init() {
        self.data = Outer{
            n1: NestedStrings{s1: "hello", s2: "world"},
            n2: NestedStrings{s1: "foo", s2: "bar"}
        };
    }
}