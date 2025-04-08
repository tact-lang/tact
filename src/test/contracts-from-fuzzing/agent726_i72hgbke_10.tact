struct Chain1 {
    val: Int;
}

struct Chain2 {
    nested: Chain1;
}

struct Chain3 {
    nested: Chain2;
}

struct Chain4 {
    nested: Chain3;
}

struct Chain5 {
    nested: Chain4;
}

contract DeepChain {
    root: Chain5;

    init() {
        self.root = Chain5{
            nested: Chain4{
                nested: Chain3{
                    nested: Chain2{
                        nested: Chain1{ val: 99 },
                    },
                },
            },
        };
    }

    receive() {
        self.root = self.root;
    }
}