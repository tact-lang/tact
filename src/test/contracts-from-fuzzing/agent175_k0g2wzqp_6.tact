struct A {
    flag: Bool;
    opt: Int?;
}

struct B {
    nestedA: A;
    s: String;
}

struct C {
    nestedB: B;
    innerInt: Int;
}

contract MultiLayeredNested {
    field: C;

    init() {
        self.field = C{
            nestedB: B{
                nestedA: A{ flag: true, opt: null },
                s: "zzz",
            },
            innerInt: 42,
        };
    }
}