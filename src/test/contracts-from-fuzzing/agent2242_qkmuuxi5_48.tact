// Attempt very deep nesting to stress recursive serialization

struct D1 {f:Int;}
struct D2 {v:D1;}
struct D3 {v:D2;}
struct D4 {v:D3;}
struct D5 {v:D4;}
struct D6 {v:D5;}
struct D7 {v:D6;}
struct D8 {v:D7;}
struct D9 {v:D8;}
struct D10 {v:D9;}

contract ExtremeDepthTest {
    data: D10;

    init() {
        self.data = D10{
            v: D9{
                v: D8{
                    v: D7{
                        v: D6{
                            v: D5{
                                v: D4{
                                    v: D3{
                                        v: D2{
                                            v: D1{f:999}
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