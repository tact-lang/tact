struct A {
    x: Int;
    b: B;
}

struct B {
    y: Int;
}

contract IndirectRec2 {
    val: A;

    init() {
        self.val = A{x:1, b: B{y:2}};
    }
}