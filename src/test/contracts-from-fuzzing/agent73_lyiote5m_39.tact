struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct Combined {
    a: A;
    b: B;
}

contract Test {
    data: Combined;

    init() {
        self.data = Combined{ a: A{ x:1 }, b: B{ y:2 } };
    }
}