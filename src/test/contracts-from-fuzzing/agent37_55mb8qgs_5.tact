struct Chain3 {
    x: Int;
}

struct Chain2 {
    nested: Chain3;
}

struct Chain1 {
    nested: Chain2;
}

contract DeepChain {
    link: Chain1;

    init() {
        self.link = Chain1{
            nested: Chain2{
                nested: Chain3{
                    x: 777
                }
            }
        };
    }
}
