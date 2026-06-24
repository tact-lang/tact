struct A {
    n: Int;
}
struct B {
    m: Int;
}
struct C {
    a: A;
    b: B;
}

contract Test {
    c: C;

    init() {
        self.c = C{ a: A{n:1}, b: B{m:2} };
    }
}