struct S1 {
    x: Int;
    y: Int;
}

struct S2 {
    a: S1;
    b: S1;
}

struct S3 {
    m: S2;
    n: S2;
}

contract C {
    data: S3;

    init() {
        self.data = S3{
            m: S2{a: S1{x:1,y:2}, b: S1{x:3,y:4}},
            n: S2{a: S1{x:5,y:6}, b: S1{x:7,y:8}}
        };
    }
}