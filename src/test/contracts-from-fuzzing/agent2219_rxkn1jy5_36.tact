struct ChainOpt1 { x: Int?; }
struct ChainOpt2 { y: ChainOpt1; }
struct ChainOpt3 { z: ChainOpt2; }

contract DeepOptChain {
    f: ChainOpt3;

    init() {
        self.f = ChainOpt3{ z: ChainOpt2{ y: ChainOpt1{ x:null } } };
    }
}