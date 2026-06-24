struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract DoubleStructs {
    first: S1;
    second: S2;

    init() {
        self.first = S1{a:1};
        self.second = S2{b:2};
    }
}