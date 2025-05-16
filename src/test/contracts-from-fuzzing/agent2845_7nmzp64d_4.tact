struct DeepNested1 {
    a: Int;
}

struct DeepNested2 {
    d1: DeepNested1;
}

struct DeepNested3 {
    d2: DeepNested2;
}

struct DeepNested4 {
    d3: DeepNested3;
}

contract DeepChainStorage {
    data: DeepNested4;

    init() {
        self.data = DeepNested4{
            d3: DeepNested3{
                d2: DeepNested2{
                    d1: DeepNested1{
                        a: 123
                    }
                }
            }
        };
    }
}