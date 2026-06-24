struct A {
    x: Int;
}

struct B {
    y: Int;
    next: A?;
}

contract Test {
    storage: B;

    init() {
        self.storage = B{
            y: 5,
            next: null
        };
    }
}
