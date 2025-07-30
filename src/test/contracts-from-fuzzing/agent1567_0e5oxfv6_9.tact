struct Chain3 {
    lv1: Chain2;
}
struct Chain2 {
    lv2: Chain1;
}
struct Chain1 {
    lv3: Int;
}

contract ChainContract {
    chain: Chain3;

    init() {
        self.chain = Chain3{
            lv1: Chain2{
                lv2: Chain1{
                    lv3: 11
                }
            }
        };
    }
}