struct Base1 {
    x: Int;
}

struct Base2 {
    y: Int;
}

struct Base3 {
    z: Int;
}

contract MultipleStructFields {
    s1: Base1;
    s2: Base2;
    s3: Base3;

    init() {
        self.s1 = Base1{ x: 1 };
        self.s2 = Base2{ y: 2 };
        self.s3 = Base3{ z: 3 };
    }
}