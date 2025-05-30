struct NestedHasOptional {
    flag: Bool?;
    num: Int?;
}

struct OuterHasNestedOption {
    nested: NestedHasOptional;
}

contract OptionInInnerStruct {
    stored: OuterHasNestedOption;
    init() {
        self.stored = OuterHasNestedOption{
            nested: NestedHasOptional{ flag: null, num: null }
        };
    }
}