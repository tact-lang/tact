// Deep optional struct chain with null and partial initialization

struct D {
    name: String;
    mark: Int;
}

struct C {
    d: D?;
    count: Int;
}

struct B {
    c: C?;
    sign: Bool;
}

struct A {
    b: B?;
    value: Int;
}

contract PartialDeepOptionChain {
    data: A;
    init() {
        self.data = A{
            b: null,
            value: 10,
        };
    }
}
