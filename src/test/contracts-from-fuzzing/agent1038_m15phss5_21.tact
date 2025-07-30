struct Child1 {
    a: Int;
}
struct Child2 {
    b: Int;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract NestedTwoStructs {
    p: Parent = Parent{ c1: Child1{a: 1}, c2: Child2{b: 2} };
    init() {}
}