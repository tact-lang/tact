struct A {
    b: B?;
}
struct B {
    c: C?;
}
struct C {
    x: Int;
}

contract TestContract {
    a: A;
    init() {
        self.a = A{ b: null };
    }
}