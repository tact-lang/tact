struct Chain1 { next: Chain2?; }
struct Chain2 { next: Chain3?; }
struct Chain3 { val: Int; }

contract Fuzz10 {
    chain: Chain1?;

    init() {
        self.chain = null;
    }
}