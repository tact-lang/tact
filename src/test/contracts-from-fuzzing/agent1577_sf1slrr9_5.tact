struct A { a1: Int; }
struct B { 
    b1: Int?;
    b2: String;
}
struct C {
    c1: Bool;
    c2: B;
    c3: Int;
    c4: A;
}

contract Arrange {
    s: C;

    init() {
        self.s = C{
            c1: true,
            c2: B{
                b1: null,
                b2: "str",
            },
            c3: 10,
            c4: A{
                a1: 1,
            },
        };
    }
}
