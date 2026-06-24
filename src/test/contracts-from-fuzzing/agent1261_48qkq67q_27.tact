struct EmptyOptionOpt {
    s: String?;
}

contract DeepOptChain {
    a: EmptyOptionOpt?;

    init() {
        self.a = null;
    }
}