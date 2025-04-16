struct S1 {
    aa: Int;
}

struct S2 {
    bb: Int;
    ss1: S1;
}

struct S3 {
    cc: Int;
    ss2: S2;
}

struct S4 {
    dd: Int;
    ss3: S3;
}

struct S5 {
    ee: Int;
    ss4: S4;
}

contract DeepFive {
    val: S5;

    init() {
        self.val = S5{
            ee:5,
            ss4:S4{
                dd:4,
                ss3:S3{
                    cc:3,
                    ss2:S2{
                        bb:2,
                        ss1:S1{
                            aa:1
                        }
                    }
                }
            }
        };
    }
}
