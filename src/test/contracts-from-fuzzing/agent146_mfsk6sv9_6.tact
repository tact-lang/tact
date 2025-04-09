struct Deep3 {
    d: Int;
}

struct Deep2 {
    c: Deep3;
}

struct Deep1 {
    b: Deep2;
}

contract Layered {
    a: Deep1 = Deep1{ b: Deep2{ c: Deep3{ d:123 } } };
}