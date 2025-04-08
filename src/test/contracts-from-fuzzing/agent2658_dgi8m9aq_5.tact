struct InnerA {
    a: Int;
}

struct InnerB {
    b: Int;
}

contract TwoStructFields {
    ia: InnerA = InnerA{ a: 1 };
    ib: InnerB = InnerB{ b: 2 };
}