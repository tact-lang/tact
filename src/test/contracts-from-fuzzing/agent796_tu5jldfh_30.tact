// Multiple structs with optional bools, strings nested several levels
struct D {
    b: Bool?;
}
struct C {
    d: D?;
    s: String?;
}
struct B {
    c: C?;
}
struct A {
    b: B?;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{ b: null };
    }
}