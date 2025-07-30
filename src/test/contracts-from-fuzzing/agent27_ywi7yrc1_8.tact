struct S {
    a: Int;
    b: Int;
}

contract ReassignStruct {
    p: S;

    init() {
        self.p = S{ a: 1, b: 2 };
        self.p = S{ a: 3, b: 4 };
    }
}