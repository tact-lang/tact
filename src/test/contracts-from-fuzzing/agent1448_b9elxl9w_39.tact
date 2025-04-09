struct Chain1 {
    foo: Int;
}

struct Chain2 {
    bar: Chain1;
}

struct Chain3 {
    qux: Chain2;
}

contract ThreeChain {
    val: Chain3;

    init() {
        self.val = Chain3{
            qux: Chain2{
                bar: Chain1{
                    foo: 42
                }
            }
        };
    }
}