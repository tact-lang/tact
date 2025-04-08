// repeat previous pattern but with initializing deepest fields explicitly

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

contract ExplicitDeepOptionChain {
    data: A;
    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        name: "leaf",
                        mark: 42,
                    },
                    count: 9,
                },
                sign: true,
            },
            value: 7,
        };
    }
}
