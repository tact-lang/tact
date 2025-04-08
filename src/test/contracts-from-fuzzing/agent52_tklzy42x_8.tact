struct DeepOptionalNest {
    inner: Int?;
}

struct WrapOpt1 {
    next: DeepOptionalNest?;
}

struct WrapOpt2 {
    next: WrapOpt1?;
}

contract ContractDeepOpt {
    data: WrapOpt2;
    init() {
        self.data = WrapOpt2{ next: null };
    }
}