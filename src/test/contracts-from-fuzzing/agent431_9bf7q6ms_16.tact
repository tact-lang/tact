struct Rec1 { v: Int; }
struct Rec2 { x: Rec1; }
struct Rec3 { x: Rec2; }
struct Rec4 { x: Rec3; }
struct Rec5 { x: Rec4; }
struct Rec6 { x: Rec5; }
struct Rec7 { x: Rec6; }
struct Rec8 { x: Rec7; }
struct Rec9 { x: Rec8; }
struct Rec10 { x: Rec9; }

contract SuperDeepContract {
    f: Rec10;

    init() {
        self.f = Rec10{
            x: Rec9{
                x: Rec8{
                    x: Rec7{
                        x: Rec6{
                            x: Rec5{
                                x: Rec4{
                                    x: Rec3{
                                        x: Rec2{
                                            x: Rec1{
                                                v: 55
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
