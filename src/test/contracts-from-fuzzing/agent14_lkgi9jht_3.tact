struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
    opt: Bool?;
}

contract TestContract {
    val: C;

    init() {
        self.val = C{
            b: B{
                a: A{
                    x: -999,
                },
            },
            opt: false,
        };
    }
}