struct A {
    f1: Int;
}

struct B {
    a: A;
    f2: Bool;
}

struct C {
    b: B;
    f3: String;
}

struct D {
    c: C;
    f4: Cell;
}

contract NestedStructs {
    d: D;

    init() {
        self.d = D{
            c: C{
               b: B{
                   a: A{f1: 42},
                   f2: true,
               },
               f3: "hi",
            },
            f4: emptyCell(),
        };
    }
}