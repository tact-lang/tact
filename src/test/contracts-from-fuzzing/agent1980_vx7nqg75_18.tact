struct OptionInOption {
    nestedOpt: InlineDefault?;
}

struct InlineDefault {
    x: Int = 42;
    y: String = "hello";
}

contract OptInStruct {
    foo: OptionInOption;

    init() {
        self.foo = OptionInOption{
            nestedOpt: null
        };
    }
}