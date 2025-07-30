struct DeeplyNestedOption {
    inner: Int?;
    flag: Bool;
}

struct WrapOption {
    nested: DeeplyNestedOption?;
    s: String;
}

contract OptionInOption {
    data: WrapOption;
    init() {
        self.data = WrapOption{
            nested: null,
            s:"hello"
        };
    }
}