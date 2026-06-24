struct DeepOne {
    d: Int?;
}

struct DeepTwo {
    d: DeepOne?;
}

struct DeepThree {
    d: DeepTwo?;
}

contract ChainPersistent {
    chain: DeepThree?;

    init() {
        self.chain = null;
    }
}