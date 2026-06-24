struct A {
    a: Int;
    b: Int?;
}

struct B {
    prev: A;
    c: Bool;
    d: Bool?;
}

struct C {
    prev: B;
    e: Int;
    f: Int?;
}

contract ChainNested {
    data: C;
    init() {
        self.data = C{
            prev: B{
                prev: A{ a:1, b:null },
                c: true, d: null
            },
            e: 7,
            f: null
        };
    }
}