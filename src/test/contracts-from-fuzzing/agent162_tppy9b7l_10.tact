struct OptionOuter {
    nestedOpt: String?;
}

contract OptStructOptField {
    data: OptionOuter?;
    init() {
        self.data = OptionOuter{
            nestedOpt: "hello",
        };
    }
}