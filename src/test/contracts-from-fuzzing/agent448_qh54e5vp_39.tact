struct Child1 { val: Int; }
struct Child2 { flag: Bool; }

contract ParamMultiNested(
    a: Child1,
    b: Child2,
    c: Child1,
    d: Child2
) {}