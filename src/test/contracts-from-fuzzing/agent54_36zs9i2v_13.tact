struct DeeplyOptional {
    a: Int?;
    b: Bool?;
}

struct WrapperOpt {
    nested: DeeplyOptional?;
    flag: Bool;
}

contract NestedOptionals {
    data: WrapperOpt;

    init() {
        self.data = WrapperOpt{
            nested: null,
            flag: true
        };
    }
}