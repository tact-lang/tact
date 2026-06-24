struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Outer {
    ia: InnerA;
    ib: InnerB;
    c: String;
}

contract Test(param: Outer) {
}