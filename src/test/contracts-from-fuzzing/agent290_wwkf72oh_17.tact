struct S1 {
    x: Int;
}

struct S2 {
    y: Int?;
    nested: S1;
}

contract TestContract {
    s: S2 = S2{ y: null, nested: S1{ x: 7 } };
}
