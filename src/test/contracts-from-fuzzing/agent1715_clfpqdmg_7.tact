struct DeeplyNested {
    s1: L1;
}
struct L1 {
    s2: L2;
}
struct L2 {
    s3: L3;
}
struct L3 {
    s4: L4;
}
struct L4 {
    s5: L5;
}
struct L5 {
    s6: L6;
}
struct L6 {
    leaf: Int;
}

contract MaxDepthTest {
    d: DeeplyNested;

    init() {
        self.d = DeeplyNested{
            s1: L1{
                s2: L2{
                    s3: L3{
                        s4: L4{
                            s5: L5{
                                s6: L6{ leaf: 77 }
                            }
                        }
                    }
                }
            }
        };
    }
}