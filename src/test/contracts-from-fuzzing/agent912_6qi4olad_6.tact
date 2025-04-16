struct A {
    x: Int?;
    y: Bool;
}

struct B {
    p: A?;
}

struct C {
    q: B?;
}

contract DeepOptionalFields {
    field: C;

    init() {
        self.field = C{ q: null };
    }
}