struct S {
    f: Int = 1;
}

contract UnionDefaults {
    a: S = S{};
    b: S = S{f:42};
    c: S = S{f:100};
    init() {}
}