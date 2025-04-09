struct S1 {
    a: Int as uint4;
    b: Bool;
}

struct S2 {
    c: Int as int8;
    d: String;
}

contract TestContract {
    val1: S1;
    val2: S2;

    init() {
        self.val1 = S1{ a: 5, b: true };
        self.val2 = S2{ c: -7, d: "hi" };
    }
}