struct S1 {
    a: Int;
}
struct S2 {
    b: Int;
}
struct S3 {
    c: Int;
}
struct S4 {
    d: Int;
}

struct Level1 {
    s1: S1;
    s2: S2;
}

struct Level2 {
    l1: Level1;
    s3: S3;
}

contract ComplexNest {
    lvl: Level2;
    s4: S4;

    init() {
        self.lvl = Level2{
            l1: Level1{
                s1: S1{a:1},
                s2: S2{b:2}
            },
            s3: S3{c:3}
        };
        self.s4 = S4{d:4};
    }
}