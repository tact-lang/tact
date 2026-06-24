// deeply nested and optional fields in many layers

struct D {
    f1: Int?;
    f2: Bool;
}

struct C {
    nestedD: D?;
    f3: String;
}

struct B {
    nestedC: C?;
    f4: Int;
}

struct A {
    nestedB: B?;
}

contract OptionalChain {
    data: A;

    init() {
        self.data = A{
            nestedB: B{
                nestedC: null,
                f4: 10
            }
        };
    }
}
