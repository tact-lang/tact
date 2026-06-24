struct A {
    a: Int;
    b: Bool;
}

struct B {
    a: Int;
    ab: A;
}

struct C {
    b: B;
}

contract ComposeABC {
    val: C;

    init() {
        self.val = C{
            b: B{
                a: 1,
                ab: A{
                    a: 2,
                    b: true
                }
            }
        };
    }
}