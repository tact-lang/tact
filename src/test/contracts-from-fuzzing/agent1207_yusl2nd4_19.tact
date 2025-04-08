struct InnerOptional {
    x: Int?;
}

struct OuterOptional {
    inner: InnerOptional?;
}

contract OptionChain {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null
        };
    }
}