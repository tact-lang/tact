// Edge: deeply nested multi-optionals with serialization
struct D {
    x: Int? as int7;
    y: Bool?;
}

struct C {
    d: D;
    z: Int? as uint4;
}

struct B {
    c: C;
    flag: Bool;
}

struct A {
    b: B;
    value: Int;
}

contract SerChain {
    s: A;

    init() {
        self.s = A{
            b: B{
                c: C{
                    d: D{ x:null, y:null },
                    z: null
                },
                flag: true
            },
            value: 1234
        };
    }
}