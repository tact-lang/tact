struct DeepA {
    x: Int;
}

struct DeepB {
    a: DeepA;
}

struct DeepC {
    b: DeepB;
}

contract DeepNest {
    deeptest: DeepC;
    
    init() {
        self.deeptest = DeepC{
            b: DeepB{
                a: DeepA{
                    x: 42
                }
            }
        };
    }
}
