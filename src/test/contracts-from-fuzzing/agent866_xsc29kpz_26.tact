struct A {
    foo: Int;
}

contract OptPointer {
    ref: A?;
    init() {
        self.ref = null;
    }
}