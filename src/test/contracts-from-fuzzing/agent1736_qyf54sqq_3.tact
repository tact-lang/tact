struct S {
    i: Int;
    b: Bool? = null;
}

contract Test {
    s: S = S{i: 10};
    init() {}
}