struct A {
    i: Int;
}

struct B {
    inner: A;
    j: Int?;
}

struct C {
    nested: B;
    k: Bool;
}

contract DeepOptional {
    data: C;

    init() {
        self.data = C{
            nested: B{
                inner: A{i: 5},
                j: null
            },
            k: true
        };
    }
}
