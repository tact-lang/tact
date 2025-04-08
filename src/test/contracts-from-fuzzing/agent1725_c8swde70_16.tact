struct DeepA {
    x: Int;
    y: Bool;
}

struct DeepB {
    d1: DeepA;
    d2: DeepA;
}

struct DeepC {
    d1: DeepB;
    d2: DeepB;
}

struct DeepD {
    d1: DeepC;
    d2: DeepC;
}

contract FourDeepPairs {
    all: DeepD;

    init() {
        self.all = DeepD{
            d1: DeepC{
                d1: DeepB{ d1: DeepA{ x:1, y:true }, d2: DeepA{ x:2, y:false } },
                d2: DeepB{ d1: DeepA{ x:3, y:true }, d2: DeepA{ x:4, y:false } }
            },
            d2: DeepC{
                d1: DeepB{ d1: DeepA{ x:5, y:true }, d2: DeepA{ x:6, y:false } },
                d2: DeepB{ d1: DeepA{ x:7, y:true }, d2: DeepA{ x:8, y:false } }
            }
        };
    }
}