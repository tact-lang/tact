struct OptionNested {
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool?;
}

contract OptionalDeep {
    nestedOpt: OptionNested;

    init() {
        self.nestedOpt = OptionNested{
            inner: InnerOpt{ x: 4, y: true },
        };
    }
}