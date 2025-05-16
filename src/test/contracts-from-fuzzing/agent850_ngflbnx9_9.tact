struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    x: S1;
    y: S1;
}

struct S3 {
    m: S2;
    n: S2;
}

contract MultiNest {
    data: S3;

    init() {
        self.data = S3{
            m: S2{
                x: S1{a:1, b:"1"},
                y: S1{a:2, b:"2"}
            },
            n: S2{
                x: S1{a:3, b:"3"},
                y: S1{a:4, b:"4"}
            }
        };
    }
}
