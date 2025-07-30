struct A {
    x: Int;
    y: Int;
}

struct B {
    s1: A;
    z: Bool;
}

struct C {
    s2: B;
    str: String;
}

contract ChainNested {
    data: C;

    init() {
        self.data = C {
            s2: B { s1: A { x:1, y:2 }, z:true },
            str: "abc",
        };
    }
}
