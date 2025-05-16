struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    c: S1;
}

struct S3 {
    d: Int;
    e: S2;
}

struct S4 {
    f: Int;
    g: S3;
}

struct S5 {
    h: Int;
    i: S4;
}

contract TestContract {
    deep: S5;

    init() {
        self.deep = S5{
            h:1,
            i:S4{
                f:2,
                g:S3{
                    d:3,
                    e:S2{
                        b:4,
                        c:S1{a:5}
                    }
                }
            }
        };
    }

    receive() {
        self.deep = self.deep;
    }
}