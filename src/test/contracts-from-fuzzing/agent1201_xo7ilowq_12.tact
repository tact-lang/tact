struct A {
    x: Int = 7;
}

struct B {
    a: A;
    y: Int;
}

contract TestContract {
    b: B;

    init() {
        self.b = B{
            a: A{},
            y: 42
        };
    }
}