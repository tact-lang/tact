struct DeepOptionalOne {
    nestedOpt: InnerDeepOpt?;
}

struct InnerDeepOpt {
    someFlag: Bool;
    nextOpt: NextDeepOpt?;
}

struct NextDeepOpt {
    num: Int;
}

contract MultiOptionalsPersistent {
    value: DeepOptionalOne;

    init() {
        self.value = DeepOptionalOne{
            nestedOpt: InnerDeepOpt{
                someFlag: true,
                nextOpt: NextDeepOpt{ num: 42 }
            }
        };
    }
}