struct Chain3 {
    a: Int;
    b: Chain2;
}

struct Chain2 {
    c: Chain1;
    d: String;
}

struct Chain1 {
    e: Bool;
}

contract MultiLayerChain {
    val: Chain3;

    init() {
        self.val = Chain3{
            a: 1,
            b: Chain2{
                c: Chain1{ e: true },
                d: "deep"
            }
        };
    }
}
