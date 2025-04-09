struct OptionNest {
    innerOpt: Int?;
    flagOpt: Bool?;
}

contract NullDeep {
    nestOpt: OptionNest?;

    init() {
        self.nestOpt = null;
    }
}