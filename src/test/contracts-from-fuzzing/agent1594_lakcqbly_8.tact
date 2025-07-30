struct A {
    n: Int;
}
struct B {
    val: Int;
    sub: A;
}
struct C {
    subB: B;
    flag: Bool;
}

contract Z {
    s: C;
    init() {
        self.s = C{ subB: B{ val: 1, sub: A{n: 2} }, flag: true };
    }
}