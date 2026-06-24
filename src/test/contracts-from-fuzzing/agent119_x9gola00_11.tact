struct Chain1 { x1: Int; }
struct Chain2 { x2: Chain1; }
struct Chain3 { x3: Chain2; }
struct Chain4 { x4: Chain3; }
struct Chain5 { x5: Chain4; }
struct Chain6 { x6: Chain5; }

contract TestContract {
    chain: Chain6;

    init() {
        self.chain = Chain6{x6: Chain5{x5: Chain4{x4: Chain3{x3: Chain2{x2: Chain1{x1: 123}}}}}};
    }

    receive() {
        let v = self.chain;
    }
}