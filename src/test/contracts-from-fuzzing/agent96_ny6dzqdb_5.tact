struct A {
    x: Int;
}

struct B {
    y: A?;
}

contract Test {
    s: B;

    init() {
        self.s = B{ y: null };
    }
}