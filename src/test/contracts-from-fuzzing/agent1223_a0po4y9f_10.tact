struct DeepOptionalStruct {
    inner: Inner1?;
}

struct Inner1 {
    inner2: Inner2?;
}

struct Inner2 {
    value: Int?;
}

contract DeepChainOptionals {
    chain: DeepOptionalStruct;
    init() {
        self.chain = DeepOptionalStruct{ inner: null };
    }
}