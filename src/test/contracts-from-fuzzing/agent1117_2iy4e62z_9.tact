struct OptionNested {
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    text: String;
}

contract OptNestedUse {
    data: OptionNested;

    init() {
        self.data = OptionNested{
            inner: null,
        };
    }
}
