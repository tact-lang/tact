struct NestedStrings {
    s1: String;
    s2: String;
}

struct Container {
    a: NestedStrings;
    b: NestedStrings;
}

contract StringNest {
    f: Container;
    init() {
        self.f = Container{
            a: NestedStrings{ s1:"one", s2:"two" },
            b: NestedStrings{ s1:"three", s2:"four" }
        };
    }
}