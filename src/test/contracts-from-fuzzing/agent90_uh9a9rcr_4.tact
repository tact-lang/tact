struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    z: Int;
}

contract ManyFields {
    a: A;
    b: B;
    c: C;
    number: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
    optStr: String?;
    bigInt: Int;
    smallInt: Int as uint8;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ y: 2 };
        self.c = C{ z: 3 };
        self.number = 12345;
        self.flag = true;
        self.text = "test";
        self.optInt = null;
        self.optStr = null;
        self.bigInt = 999999;
        self.smallInt = 255;
    }
}