struct OptionalsNest {
    innerOpt: Inner?;
    label: String;
}

struct Inner {
    val: Int;
    desc: String;
}

contract WithOptionalNestedStruct {
    data: OptionalsNest;

    init() {
        self.data = OptionalsNest{
            innerOpt: null,
            label: "hello"
        };
    }
}