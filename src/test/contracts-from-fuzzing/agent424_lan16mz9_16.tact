struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract FlatData {
    x: Int;
    d: S3;

    init() {
        self.x = 5;
        self.d = S3{
            s2: S2{ b: 8, s1: S1{a: 9} }
        };
    }
}