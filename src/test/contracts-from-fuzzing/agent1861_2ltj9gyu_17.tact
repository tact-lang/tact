struct S1 { x: Int; }
struct S2 { f: S1; }
struct S3 { f: S2; }
struct S4 { f: S3; }
struct S5 { f: S4; }
struct S6 { f: S5; }

contract Nested6Deep {
    data: S6;

    init() {
        self.data = S6{
            f: S5{
                f: S4{
                    f: S3{
                        f: S2{
                            f: S1{
                                x: 123
                            }
                        }
                    }
                }
            }
        };
    }
}