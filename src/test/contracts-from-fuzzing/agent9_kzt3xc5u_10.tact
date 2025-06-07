struct S1 { one: Int; }
struct S2 { two: S1; }
struct S3 { three: S2; }
struct S4 { four: S3; }
struct S5 { five: S4; }
struct S6 { six: S5; }
struct S7 { seven: S6; }

contract SevenNest {
    val: S7;

    init() {
        self.val = S7{
            seven: S6{
                six: S5{
                    five: S4{
                        four: S3{
                            three: S2{
                                two: S1{
                                    one: 77
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}