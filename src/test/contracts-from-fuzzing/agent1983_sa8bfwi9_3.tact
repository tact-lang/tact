struct C {
    v1: Int;
    v2: Bool?;
}

struct B {
    innerC: C;
    s2: String?;
}

struct A {
    innerB: B;
    n: Int;
}

contract DeepNestedStorage {
    data: A;

    init() {
        self.data = A{
            innerB: B{
                innerC: C{
                    v1: 10,
                    v2: null
                },
                s2: "ok"
            },
            n: 55
        };
    }
}