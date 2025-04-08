struct X1 { v: Int; }
struct X2 { v: X1; }
struct X3 { v: X2; }
struct X4 { v: X3; }
struct X5 { v: X4; }
struct X6 { v: X5; }
struct X7 { v: X6; }
struct X8 { v: X7; }
struct X9 { v: X8; }
struct X10 { v: X9; }

contract TenLevelNest {
    val: X10 = X10{
        v: X9{
            v: X8{
                v: X7{
                    v: X6{
                        v: X5{
                            v: X4{
                                v: X3{
                                    v: X2{
                                        v: X1{v:123}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    };
}