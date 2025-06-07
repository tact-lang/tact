struct DeepChain1 {
    c2: DeepChain2;
}

struct DeepChain2 {
    c3: DeepChain3;
}

struct DeepChain3 {
    c4: DeepChain4;
}

struct DeepChain4 {
    c5: DeepChain5;
}

struct DeepChain5 {
    val: Int;
}

contract DeepChainContract {
    data: DeepChain1;

    init() {
        self.data = DeepChain1{
            c2: DeepChain2{
                c3: DeepChain3{
                    c4: DeepChain4{
                        c5: DeepChain5{
                            val: 55
                        }
                    }
                }
            }
        };
    }
}