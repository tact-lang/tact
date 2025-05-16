struct A {
    aa: Int;
    ab: Bool?
}

struct B {
    ba: A;
    bb: Int?;
    bc: Bool;
}

struct C {
    ca: B;
    cb: String?;
}

struct D {
    da: C;
    db: Cell;
}

struct E {
    ea: D;
    eb: Slice?;
}

contract VeryDeep {
    deep: E;

    init() {
        self.deep = E{
            ea: D{
                da: C{
                    ca: B{
                        ba: A{
                            aa: 5,
                            ab: null,
                        },
                        bb: null,
                        bc: true,
                    },
                    cb: null,
                },
                db: emptyCell(),
            },
            eb: null,
        };
    }
}