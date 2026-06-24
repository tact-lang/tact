struct Chain1 { x: Int }
struct Chain2 { y: Chain1 }
struct Chain3 { z: Chain2 }

contract MultiChainNested {
    n: Chain3;

    init() {
        self.n = Chain3{z: Chain2{y: Chain1{x: 99}}};
    }
}