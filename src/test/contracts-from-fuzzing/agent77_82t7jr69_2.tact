struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    s1: Nested = Nested{x: 1, y: true};
    opt_s2: Nested? = null;
    init() {}
}