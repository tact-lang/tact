struct DeepChain1 {
    x: Int;
}

struct DeepChain2 {
    y: DeepChain1;
}

struct DeepChain3 {
    z: DeepChain2;
}

struct DeepChain4 {
    w: DeepChain3;
}

contract VeryDeepNested {
    val: DeepChain4;

    init() {
        self.val = DeepChain4{
            w: DeepChain3{
                z: DeepChain2{
                    y: DeepChain1{
                        x: 42
                    }
                }
            }
        };
    }
}