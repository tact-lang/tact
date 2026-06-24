struct Leaf {
    i: Int;
}

struct B {
    leaf: Leaf;
}

struct A {
    b: B;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{ b: B{ leaf: Leaf{ i: 5 } } };
    }
}