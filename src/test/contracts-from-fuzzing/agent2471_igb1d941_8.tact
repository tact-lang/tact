struct DeepOptional {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    deepOpt: Int?;
    flag: Bool;
}

contract ContractDeepOpt {
    val: DeepOptional;

    init() {
        self.val = DeepOptional{
            innerOpt: InnerStruct{
                deepOpt: null,
                flag: false,
            },
        };
    }
}