struct A {
    x: Int = 1;
}

struct B {
    y: Int = 2;
}

contract ManyStructFields {
    aField: A;
    bField: B;
    intField: Int = 42;

    init() {
        self.aField = A{};
        self.bField = B{};
    }
}