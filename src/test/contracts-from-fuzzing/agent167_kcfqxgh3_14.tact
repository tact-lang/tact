struct DeepChain5 {
    val: Int = 5;
}

struct DeepChain4 {
    next: DeepChain5;
}

struct DeepChain3 {
    next: DeepChain4;
}

struct DeepChain2 {
    next: DeepChain3;
}

struct DeepChain1 {
    next: DeepChain2;
}

contract ChainNested {
    root: DeepChain1;

    init() {
        self.root = DeepChain1{
            next: DeepChain2{
                next: DeepChain3{
                    next: DeepChain4{
                        next: DeepChain5{ val: 99 }
                    }
                }
            }
        };
    }
}