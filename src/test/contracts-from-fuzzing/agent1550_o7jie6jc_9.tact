struct InnerMost {
    val: Int;
}

struct Mid2 {
    i: InnerMost;
}

struct Mid1 {
    m: Mid2;
}

struct Top {
    t: Mid1;
}

contract MultiLayerDeep {
    s: Top;
    init() {
        self.s = Top{
            t: Mid1{
                m: Mid2{
                    i: InnerMost{
                        val: 123,
                    }
                }
            }
        };
    }
}