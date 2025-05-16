struct Rec1 { a: Int; }
struct Rec2 { b: Rec1; }
struct Rec3 { c: Rec2; }
struct Rec4 { d: Rec3; }
struct Rec5 { e: Rec4; }
struct Rec6 { f: Rec5; }
struct Rec7 { g: Rec6; }
struct Rec8 { h: Rec7; }
struct Rec9 { i: Rec8; }
struct Rec10 { j: Rec9; }

contract TestContract {
    val: Rec10;

    init() {
        self.val = Rec10{
            j: Rec9{
                i: Rec8{
                    h: Rec7{
                        g: Rec6{
                            f: Rec5{
                                e: Rec4{
                                    d: Rec3{
                                        c: Rec2{
                                            b: Rec1{
                                                a: 99
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
}