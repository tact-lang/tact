struct DeepOptStruct {
    inner: InnerOpt?;
}

struct InnerOpt {
    num: Int?;
    flag: Bool?;
}

contract ContractDeepOpt {
    data: DeepOptStruct;

    init() {
        self.data = DeepOptStruct{ inner: null };
    }
}