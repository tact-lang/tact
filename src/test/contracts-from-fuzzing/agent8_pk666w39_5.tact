struct Chain3 {
    one: Chain2;
}

struct Chain2 {
    two: Chain1;
}

struct Chain1 {
    three: Int;
}

contract DeepChain {
    s: Chain3;

    init() {
        self.s = Chain3{
            one: Chain2{
                two: Chain1{
                    three: 7
                }
            }
        };
    }
}