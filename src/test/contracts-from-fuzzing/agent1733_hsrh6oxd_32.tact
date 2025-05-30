struct A {
    a: Int?;
}

struct B {
    b: A?;
}

struct C {
    c: B?;
}

struct Outer {
    nested: C?;
}

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer { nested: null };
    }
}