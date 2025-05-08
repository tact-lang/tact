struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract TestContract {
    one: A;
    two: B;

    init() {
        self.one = A{x: 10};
        self.two = B{y: 20};
    }
}