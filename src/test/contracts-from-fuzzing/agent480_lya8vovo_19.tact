struct LargeNest1 {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct LargeNest2 {
    nest1: LargeNest1;
    f: Int;
    g: Int;
}

struct LargeNest3 {
    nest2: LargeNest2;
    h: Int;
}

contract BigNested {
    root: LargeNest3;

    init() {
        self.root = LargeNest3{
            nest2: LargeNest2{
                nest1: LargeNest1{
                    a: 1,
                    b: 2,
                    c: 3,
                    d: 4,
                    e: 5,
                },
                f: 6,
                g: 7,
            },
            h: 8,
        };
    }
}