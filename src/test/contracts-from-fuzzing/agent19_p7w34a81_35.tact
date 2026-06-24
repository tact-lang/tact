struct S {
    f1: Int;
}

contract DoubleSameStruct {
    a: S;
    b: S;

    init() {
        self.a = S{ f1: 10 };
        self.b = S{ f1: 20 };
    }
}