struct NestedStrings {
    s1: String;
    s2: String;
}

struct DoubleNested {
    outer1: NestedStrings;
    outer2: NestedStrings;
}

contract StringNest {
    store: DoubleNested = DoubleNested{
        outer1: NestedStrings{s1:"hello",s2:"world"},
        outer2: NestedStrings{s1:"foo",s2:"bar"}
    };
    receive() {}
}