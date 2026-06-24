struct OptionalStructs {
    s1: S1?;
    s2: S2?;
}

struct S1 {
    f1: Int;
}

struct S2 {
    f2: Bool;
}

contract NestedOptionals {
    nested: OptionalStructs = OptionalStructs{ s1: null, s2: null };
}