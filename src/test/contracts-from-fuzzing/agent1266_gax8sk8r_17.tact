struct Inner {
    a: Int;
}

struct Mid {
    b: Inner?;
}

struct Outer {
    c: Mid?;
}

contract NestedOptionalStructs {
    s: Outer = Outer{ c: null };

    init() {}
}