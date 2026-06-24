struct A {
    one: Int;
    two: Int;
}

struct B {
    x: A;
    y: Int;
}

struct C {
    m: B;
    n: A;
}

struct D {
    k: C;
    j: Bool;
}

contract ABCD {
    val: D;
    init() {
        self.val = D{
            k: C{
                m: B{
                    x: A{one:1,two:2},
                    y: 3
                },
                n: A{one:4,two:5}
            },
            j: true
        };
    }
}
