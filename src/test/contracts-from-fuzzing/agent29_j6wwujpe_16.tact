struct T1 { f1: Int; }
struct T2 { f2: T1; }
struct T3 { f3: T2; }
struct T4 { f4: T3; }
struct T5 { f5: T4; }
struct T6 { f6: T5; }
struct T7 { f7: T6; }
struct T8 { f8: T7; }
struct T9 { f9: T8; }

contract VeryDeep {
    data: T9;

    init() {
        self.data = T9{
            f9: T8{
                f8: T7{
                    f7: T6{
                        f6: T5{
                            f5: T4{
                                f4: T3{
                                    f3: T2{
                                        f2: T1{ f1: 42 }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}