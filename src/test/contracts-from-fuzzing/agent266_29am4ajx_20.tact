struct DeepLayer4 {
    i: Int;
}

struct DeepLayer3 {
    d4: DeepLayer4;
}

struct DeepLayer2 {
    d3: DeepLayer3;
}

struct DeepLayer1 {
    d2: DeepLayer2;
}

contract FourDeep {
    data: DeepLayer1;

    init() {
        self.data = DeepLayer1{
            d2: DeepLayer2{
                d3: DeepLayer3{
                    d4: DeepLayer4{
                        i: 42
                    }
                }
            }
        };
    }
}