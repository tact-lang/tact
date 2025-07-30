struct OptionFirst {
    opt: Int?;
    req: Int;
}

contract OptionalLeading {
    data: OptionFirst;

    init() {
        self.data = OptionFirst{
            opt: null,
            req: 123
        };
    }
}