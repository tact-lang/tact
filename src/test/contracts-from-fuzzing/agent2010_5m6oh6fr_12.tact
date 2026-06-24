struct A {
    a: Int;
}
struct B {
    b: Int;
    next: A;
}
struct C {
    c: Int;
    next: B;
}

contract Chain {
    x: C;

    init() {
        self.x = C{
            c:1,
            next: B{ b:2, next: A{a:3} }
        };
    }
}