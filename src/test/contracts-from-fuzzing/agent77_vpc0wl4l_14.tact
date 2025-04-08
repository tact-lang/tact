struct A {
    x: Int;
}

struct B {
    a: A?;
}

contract NestedOptionals {
    data: B;

    init() {
        self.data = B{a: null};
    }

    receive() {
        self.data = B{a: A{x: 100}};
    }
}
