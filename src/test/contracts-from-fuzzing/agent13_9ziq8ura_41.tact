struct A {
    a: Int?;
}

struct B {
    b: A?;
}

struct C {
    c: B?;
}

contract DeepOptionals {
    f: C?;

    init() {
        self.f = null;
    }
}