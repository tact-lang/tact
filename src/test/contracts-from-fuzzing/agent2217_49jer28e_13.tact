struct L1 {
    lx: Int;
    ly: Int;
}
struct L2 {
    l1: L1;
    z: Int;
}
struct L3 {
    l2: L2;
    k: Int;
}
contract LongChain {
    chain: L3;

    init() {
        self.chain = L3{
            l2: L2{
                l1: L1{
                    lx: 1,
                    ly: 2
                },
                z: 3
            },
            k: 4
        };
    }
}
