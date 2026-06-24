struct DeepNested1 {
    x: Int;
}

struct DeepNested2 {
    n1: DeepNested1;
}

struct DeepNested3 {
    n2: DeepNested2;
}

struct DeepNested4 {
    n3: DeepNested3;
}

contract DeepContract {
    data: DeepNested4;
    init() {
        self.data = DeepNested4{
            n3: DeepNested3{
                n2: DeepNested2{
                    n1: DeepNested1{
                        x: 99
                    }
                }
            }
        };
    }
}