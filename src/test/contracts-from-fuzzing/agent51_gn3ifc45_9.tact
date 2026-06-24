struct NextNest {
    inner: Int;
}

struct DeepNest1 {
    nn: NextNest;
}

struct DeepNest2 {
    d1: DeepNest1;
}

struct DeepNest3 {
    d2: DeepNest2;
}

struct DeepNest4 {
    d3: DeepNest3;
}

contract Inception {
    dep: DeepNest4;
    init() {
        self.dep = DeepNest4{
            d3: DeepNest3{
                d2: DeepNest2{
                    d1: DeepNest1{
                        nn: NextNest{ inner: 999 }
                    }
                }
            }
        };
    }
}
