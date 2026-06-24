struct C {
    a: Int;
}
struct B {
    c: C;
}
struct A {
    b: B;
}

contract Test {
    s: A?;

    init() {
        self.s = A{ b: B{ c: C{ a: 7 } } };
    }

    receive() {
        let _ = self.s;
    }
}