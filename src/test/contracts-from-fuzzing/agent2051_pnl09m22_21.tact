struct A {
    x: Int;
}

struct B {
    a: A;
}

contract NullNestedInitial {
    b: B?;

    init() {
        self.b = null;
    }
}