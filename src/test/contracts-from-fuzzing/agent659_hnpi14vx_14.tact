struct C {
    foo: Int;
}

struct B {
    inner: C;
}

struct A {
    nested: B;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            nested: B{
                inner: C{
                    foo: 777,
                },
            },
        };
    }
}