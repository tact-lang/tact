struct InnerMost {
    d: Int;
}
struct Middle {
    c: InnerMost;
}
struct Outer {
    b: Middle;
}

contract DeepFields {
    nested: Outer = Outer{b: Middle{c: InnerMost{d: 4}}};
}