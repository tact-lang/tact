struct A {
    x: Int = 1;
}

struct B {
    y: Int;
}

contract MixedDefaults {
    a: A;
    b: B;

    init() {
        self.a = A{};
        self.b = B{ y:2 };
    }
}