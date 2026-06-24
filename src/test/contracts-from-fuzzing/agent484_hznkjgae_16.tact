struct A {
    aa: Int;
    ab: Bool;
    ac: String;
}

struct B {
    ba: Int?;
    bb: Bool?;
    bc: String?;
}

struct C {
    ca: A;
    cb: B;
}

contract TestContract {
    x: C;

    init() {
        self.x = C{
            ca: A{ aa: 0, ab: false, ac: "" },
            cb: B{ ba: null, bb: null, bc: null },
        };
    }
}