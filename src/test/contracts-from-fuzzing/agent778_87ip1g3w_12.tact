struct A {
    x: Int;
    y: Bool;
}

struct B {
    p: Int;
    q: Bool;
}

contract ManyStructFields {
    a: A;
    b: B;
    flag: Bool = true;
    num: Int = 123;
    init() {
        self.a = A{ x: 1, y: false };
        self.b = B{ p: 7, q: true };
    }
}