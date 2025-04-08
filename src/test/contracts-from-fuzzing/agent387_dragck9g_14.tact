struct Chain1 {
    next: Chain2;
}
struct Chain2 {
    next: Chain3;
}
struct Chain3 {
    leaf: Int;
}

contract ChainTest {
    chain: Chain1;
    init() {
        self.chain = Chain1{next: Chain2{next: Chain3{leaf:42}}};
    }
}
