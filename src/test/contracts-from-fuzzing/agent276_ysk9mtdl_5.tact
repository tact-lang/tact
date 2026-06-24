struct A {
    v1: Int;
    v2: Int;
}

struct B {
    a: A;
    b: Int;
    c: String;
}

struct C {
    d: Bool;
    e: String;
    b: B;
}

contract NestedStructsComplex {
    data: C;

    init() {
        self.data = C{
            d: true,
            e: "ok",
            b: B{
                a: A{ v1: 1, v2: 2 },
                b: 3,
                c: "hi"
            }
        };
    }
}
