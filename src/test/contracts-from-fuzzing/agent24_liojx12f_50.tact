trait T {
    s: S;
}

struct S {
    x: Int;
}

contract A with T {
    s: S = S{x:1};
    init() {}
}

contract B with T {
    s: S = S{x:2};
    init() {}
}

// test inheritance with structs as persistent storage