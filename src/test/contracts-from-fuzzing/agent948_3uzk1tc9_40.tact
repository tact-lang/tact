struct ManyDeepLevels {
    a: Int;
    b: Int;
}

struct Deep1 {
    m: ManyDeepLevels;
}

struct Deep2 {
    d1: Deep1;
}

struct Deep3 {
    d2: Deep2;
}

struct Deep4 {
    d3: Deep3;
}

contract UltraDeep {
    field: Deep4;

    init() {
        self.field = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{
                        m: ManyDeepLevels{
                            a: 1,
                            b: 2
                        }
                    }
                }
            }
        };
    }
}