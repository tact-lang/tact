struct L1 { val: Int = 42; }
struct L2 { l1: L1; }
struct L3 { l2: L2?; }
struct L4 { l3: L3; }

contract NullMidLevel {
    chain: L4;

    init() {
        self.chain = L4{
            l3: L3{ l2: null }
        };
    }

    receive() {
        let _ = self.chain;
    }
}