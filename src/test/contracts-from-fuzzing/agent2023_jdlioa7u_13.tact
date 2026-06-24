struct X1 { a: Int }
struct X2 { a: X1 }
struct X3 { a: X2 }
struct X4 { a: X3 }
struct X5 { a: X4 }
struct X6 { a: X5 }
struct X7 { a: X6 }
struct X8 { a: X7 }
struct X9 { a: X8 }
struct X10 { a: X9 }
struct X11 { a: X10 }
struct X12 { a: X11 }
struct X13 { a: X12 }
struct X14 { a: X13 }
struct X15 { a: X14 }

contract TestContract {
    superDeep: X15;
    init() {
        self.superDeep = X15{
            a: X14{
                a: X13{
                    a: X12{
                        a: X11{
                            a: X10{
                                a: X9{
                                   a: X8{
                                      a: X7{
                                         a: X6{
                                            a: X5{
                                               a: X4{
                                                   a: X3{
                                                      a: X2{
                                                         a: X1{
                                                           a: 777
                                                         }
                                                      }
                                                   }
                                               }
                                            }
                                         }
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
    receive() {
        let n = self.superDeep.a.a.a.a.a.a.a.a.a.a.a.a.a.a;
    }
}