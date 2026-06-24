struct Chain3 {
    s: Chain2;
}

struct Chain2 {
    s: Chain1;
}

struct Chain1 {
    x: Int;
}

contract ChainNested {
    val: Chain3;

    init() {
        self.val = Chain3{
            s: Chain2{
                s: Chain1{x: 101}
            }
        };
    }
}