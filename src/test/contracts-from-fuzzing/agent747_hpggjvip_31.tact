struct A {
    v: Int as uint8;
}

struct B {
    w: A?;
}

contract TestContract {
    val: B;

    init() {
        self.val = B {
            w: null,
        };
    }
}