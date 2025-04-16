struct S1 {
    f: Int;
}

struct S2 {
    f: S1;
}

struct S3 {
    f: S2;
}

struct S4 {
    f: S3;
}

struct S5 {
    f: S4;
}

contract Test {
    data: S5;

    init() {
        self.data = S5{
            f: S4{
                f: S3 {
                    f: S2 {
                        f: S1 {
                            f: 7
                        }
                    }
                }
            }
        };
    }
}