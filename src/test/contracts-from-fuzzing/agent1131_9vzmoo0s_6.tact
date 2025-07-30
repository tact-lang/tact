struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
    opt: Bool?;
}

struct C {
    c: Int;
    b: B;
    nestedOpt: Int?;
}

struct D {
    d: Int;
    c: C;
}

contract DeepOptTest {
    data: D;

    init() {
        self.data = D{
            d: 1,
            c: C{
                c:2,
                b: B{
                    b:3,
                    a: A{a:4},
                    opt:true,
                },
                nestedOpt: null,
            },
        };
    }
}