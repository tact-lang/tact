struct A {
    x: Int as uint8;
}

struct B {
    y: Int as int16;
}

contract MixedNestedSerial {
    a: A;
    b: B;
    init() {
        self.a = A{ x: 7 };
        self.b = B{ y: -1234 };
    }
}