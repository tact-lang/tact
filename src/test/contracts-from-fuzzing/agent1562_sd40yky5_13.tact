struct DeepOpt {
    sub: SubOption?; 
    amount: Int;
}

struct SubOption {
    desc: String?;
    inner: Int?;
}

contract TestContract {
    storage: DeepOpt;
    init() {
        self.storage = DeepOpt{
            sub: null,
            amount: 0,
        };
    }
}