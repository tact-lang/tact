struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    z: Int;
}

contract MultipleNestedStructs {
    fa: A;
    fb: B;
    fc: C;

    init() {
        self.fa = A{ x: 1 };
        self.fb = B{ y: 2 };
        self.fc = C{ z: 3 };
    }
}
