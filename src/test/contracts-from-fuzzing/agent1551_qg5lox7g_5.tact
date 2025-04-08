struct Chain2 {
    val: Int;
}

struct Chain1 {
    c2: Chain2;
}

struct Chain0 {
    c1: Chain1;
}

contract DeepChain {
    c: Chain0;

    init() {
        self.c = Chain0{ c1: Chain1{ c2: Chain2{ val: 42 } } };
    }
}