struct NestedString {
    s1: String;
    s2: String;
}

struct Wrap {
    nested: NestedString;
}

contract StringNest {
    val: Wrap = Wrap{nested: NestedString{s1:"foo", s2:"bar"}};
}
