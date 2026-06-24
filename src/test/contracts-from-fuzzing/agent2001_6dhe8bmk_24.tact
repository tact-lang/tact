struct Chain1 { next: Chain2?; }
struct Chain2 { next: Chain3?; }
struct Chain3 { val: Int; }

contract OptionalChainContract {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            next: Chain2{
                next: null
            }
        };
    }
}