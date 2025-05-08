struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    val: Int?;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    val: null,
                },
            },
        };
    }
}
