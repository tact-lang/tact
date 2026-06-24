// Mix of multiple optional nested structs
struct DeepNest {
    a: A?;
}

struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    foo: Int?;
}

contract TestDeepStructNest {
    x: DeepNest;
    init() {
        self.x = DeepNest{ a: null };
    }
}