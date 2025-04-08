struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract OptionalDeep {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            innerOpt: null,
        };
    }
}