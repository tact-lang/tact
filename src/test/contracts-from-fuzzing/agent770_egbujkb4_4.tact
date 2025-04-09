struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    z: Int;
}

contract WideFields {
    a: A;
    b: B;
    c: C;
    n1: Int;
    n2: Int;
    n3: Int;
    flag1: Bool;
    flag2: Bool;
    text1: String;
    text2: String;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ y: 2 };
        self.c = C{ z: 3 };
        self.n1 = 4;
        self.n2 = 5;
        self.n3 = 6;
        self.flag1 = true;
        self.flag2 = false;
        self.text1 = "foo";
        self.text2 = "bar";
    }
}
