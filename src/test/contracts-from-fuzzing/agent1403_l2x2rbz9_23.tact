struct Deep1 {
    f1: Int;
}

struct Deep2 {
    f2: Deep1;
}

struct Deep3 {
    f3: Deep2;
}

struct Deep4 {
    f4: Deep3;
}

struct Deep5 {
    f5: Deep4;
}

struct Deep6 {
    f6: Deep5;
}

struct Deep7 {
    f7: Deep6;
}

contract DeepNest7 {
    data: Deep7;

    init() {
        self.data = Deep7{
            f7: Deep6{
                f6: Deep5{
                    f5: Deep4{
                        f4: Deep3{
                            f3: Deep2{
                                f2: Deep1{
                                    f1: 77
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}