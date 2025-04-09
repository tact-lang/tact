struct A {
    a: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract Test {
    nested: C?;
    init() {
        self.nested = null;
    }
}