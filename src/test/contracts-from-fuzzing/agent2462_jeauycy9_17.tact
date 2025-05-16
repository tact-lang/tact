struct N3 { v3: Int; }
struct N2 { mid: N3; }
struct N1 { top: N2; }

contract DeepChain {
    chain: N1;
    init() {
        self.chain = N1{top: N2{mid: N3{v3: 777}}};
    }
}