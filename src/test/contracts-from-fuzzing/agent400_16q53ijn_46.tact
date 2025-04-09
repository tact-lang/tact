// testing nested struct field optionals with default null and full assign
struct SubInner {
    foo: Int;
    bar: Bool;
}

struct SubOuter {
    s: SubInner?;
}

contract NestedAssignNullOpt {
    nested: SubOuter = SubOuter{ s: null };
    init() {}
}