struct Deep7 { v: Int; }
struct Deep6 { d7: Deep7; }
struct Deep5 { d6: Deep6; }
struct Deep4 { d5: Deep5; }
struct Deep3 { d4: Deep4; }
struct Deep2 { d3: Deep3; }
struct Deep1 { d2: Deep2; }

contract DeepChainTest {
    root: Deep1;
    init() {
        self.root = Deep1{
            d2: Deep2{
                d3: Deep3{
                    d4: Deep4{
                        d5: Deep5{
                            d6: Deep6{
                                d7: Deep7{v: 777}
                            }
                        }
                    }
                }
            }
        };
    }
}
