struct Chain3 {
    c: Int;
}

struct Chain2 {
    b: Chain3;
}

struct Chain1 {
    a: Chain2;
}

contract ChainPersistent {
    root: Chain1;

    init() {
        self.root = Chain1{
            a: Chain2{
                b: Chain3{
                    c: 42,
                }
            }
        };
    }

    receive() {
        let _ = self.root;
    }
}