struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: Int;
    s1: S1;
}

struct S3 {
    p: String;
    s2: S2;
}

contract TestContract {
    info: S3;

    init() {
        self.info = S3{
            p:"hi",
            s2: S2{
                x:1,
                s1: S1{
                    a:2,
                    b:true
                }
            }
        };
    }

    receive() {
        self.info = S3{
            p:"bye",
            s2: S2{
                x:3,
                s1: S1{
                    a:4,
                    b:false
                }
            }
        };
    }
}