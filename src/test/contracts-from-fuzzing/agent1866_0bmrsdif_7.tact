struct OptionalNested {
    innerOpt: Inner?;
    flag: Bool;
}

struct Inner {
    num: Int;
    optBool: Bool?;
}

contract OptStruct {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            innerOpt: null,
            flag: true,
        };
    }
}