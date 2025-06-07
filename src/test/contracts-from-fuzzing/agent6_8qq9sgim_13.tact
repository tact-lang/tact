struct OptionInOption {
    nested: Inner?;
}

struct Inner {
    val: Int?;
}

contract OptInOpt {
    f: OptionInOption;

    init() {
        self.f = OptionInOption{
            nested: Inner{val:null}
        };
    }
}