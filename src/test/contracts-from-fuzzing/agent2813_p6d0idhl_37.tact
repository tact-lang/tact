struct DeepOptionalTop {
    s: SubOptional?;
}

struct SubOptional {
    v: Int?;
}

contract TestDeepOptionalTop {
    param: DeepOptionalTop;
    init() {
        self.param = DeepOptionalTop{
            s: SubOptional{
                v: null
            }
        };
    }
}
