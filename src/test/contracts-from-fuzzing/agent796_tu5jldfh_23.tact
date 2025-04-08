// Deep nesting of optionals without defaults
struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    value: Int?;
}

contract TestContract {
    a: A?;

    init() {
        self.a = null;
    }
}