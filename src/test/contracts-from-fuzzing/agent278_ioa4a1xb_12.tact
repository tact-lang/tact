struct Chain {
    x: Int;
    inner: ChainInner;
}

struct ChainInner {
    y: Int?;
    deep: ChainDeeper;
}

struct ChainDeeper {
    z: Bool;
}

contract ComplexNested {
    val: Chain;
    init() {
        self.val = Chain{
            x: 7,
            inner: ChainInner{
                y: null,
                deep: ChainDeeper{ z: true }
            }
        };
    }
}