struct DeepOpt1 { a:Int? }
struct DeepOpt2 { d:DeepOpt1? }
struct DeepOpt3 { d:DeepOpt2? }

contract DeepOptionChain {
    chain: DeepOpt3;

    init() {
        self.chain = DeepOpt3{
            d: null
        };
    }
}