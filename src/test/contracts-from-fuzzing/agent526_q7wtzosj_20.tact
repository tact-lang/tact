struct OptionalsNestedStruct {
    nestedOpt: Nested?;
}

struct Nested {
    deepOpt: DeepOption?;
}

struct DeepOption {
    flag: Bool;
}

contract NestedOptContract {
    data: OptionalsNestedStruct;

    init() {
        self.data = OptionalsNestedStruct{
            nestedOpt: Nested{
                deepOpt: DeepOption{
                    flag: true
                },
            },
        };
    }
}
