struct Chain3 {
    z: Int;
}

struct Chain2 {
    y: Chain3;
}

struct Chain1 {
    x: Chain2;
}

contract ChainDeep {
    c: Chain1;

    init() {
        self.c = Chain1{x: Chain2{y: Chain3{z: 999}}};
    }
}
