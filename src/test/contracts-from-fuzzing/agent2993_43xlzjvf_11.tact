struct A {
    aa: Int;
    ab: Bool;
}

struct B {
    ba: A;
    bb: Int;
}

struct C {
    ca: Bool;
    cb: B;
}

contract MultiLayer {
    top: C;

    init() {
        self.top = C{
            ca: true,
            cb: B{
                ba: A{ aa: 1, ab: false },
                bb: 100,
            },
        };
    }
}