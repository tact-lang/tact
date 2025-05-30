struct A {
    x: Int;
    y: Bool;
}

struct B {
    q: Bool;
    z: A;
}

contract OptionalNestedTest {
    field: B?;

    init() {
        self.field = null;
    }
}