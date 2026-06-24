struct A {
    x: Int;
    y: Bool;
}

struct B {
    p: A;
    z: Int;
}

struct C {
    q: B;
    r: Bool?;
}

contract Test {
    s: C;
    init() {
        self.s = C{
            q: B{
                p: A{ x:10, y:true },
                z: 20
            },
            r: null
        };
    }
}