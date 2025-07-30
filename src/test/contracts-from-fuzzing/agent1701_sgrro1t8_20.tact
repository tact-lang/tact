struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract MultiStructFields {
    first: S1;
    second: S2;

    init() {
        self.first = S1{a:42};
        self.second = S2{b:24};
    }
}