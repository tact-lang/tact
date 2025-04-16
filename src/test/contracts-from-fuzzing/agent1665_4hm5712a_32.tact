struct S1 { f: Int; }
struct S2 { s: S1; }
struct S3 { s: S2; }
struct S4 { s: S3; }
struct S5 { s: S4; }
struct S6 { s: S5; }

contract Test32 {
    data: S6;

    init() {
        self.data = S6{
            s: S5{
                s: S4{
                    s: S3{
                        s: S2{
                            s: S1{f:123}
                        }
                    }
                }
            }
        };
    }
}