struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract ManyNestings {
    data: C;

    init() {
        self.data = C{ b: B{ a: A{ x: 123 } } };
    }
}