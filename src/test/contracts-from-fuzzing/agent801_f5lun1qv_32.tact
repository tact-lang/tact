struct A {
    fieldA: Int;
}

struct B {
    fieldB: Int;
}

struct C {
    a: A;
    b: B;
}

struct D {
    c: C;
    optInt: Int?;
}

contract NestedStructChain {
    chain: D;

    init() {
        self.chain = D{
            c: C{
                a: A{ fieldA: 10 },
                b: B{ fieldB: 20 }
            },
            optInt: 30
        };
    }
}