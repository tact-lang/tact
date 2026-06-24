struct A {
    val: Int = 1;
}

struct B {
    x: Int = 5;
    a: A;
}

contract TestDefaults {
    s: B;
    init() {
        self.s = B { x:10, a: A{} };
    }
    receive() {}
}