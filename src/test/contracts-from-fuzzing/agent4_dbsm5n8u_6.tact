struct A {
    x: Int;
}

struct B {
    a: A?;
    y: Int;
}

contract TestContract {
    b: B;

    init() {
        self.b = B{
            a: null,
            y: 5
        };
    }
}