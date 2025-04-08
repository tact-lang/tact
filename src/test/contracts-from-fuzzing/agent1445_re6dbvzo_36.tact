struct OptionChain {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract ChainOfOptionals {
    data: OptionChain;

    init() {
        self.data = OptionChain{
            a: null,
            b: null,
            c: null,
        };
    }
}