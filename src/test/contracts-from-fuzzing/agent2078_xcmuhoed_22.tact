struct S1 {
    x: Int = 10;
}

struct S2 {
    s1a: S1 = S1{ x: 1 };
    s1b: S1 = S1{ x: 2 };
}

contract Test {
    arr: S2 = S2{ s1a: S1{ x: 3 }, s1b: S1{ x: 4 } };
    init() {}
}