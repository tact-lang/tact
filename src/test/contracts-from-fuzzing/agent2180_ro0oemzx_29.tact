struct Wrap {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract OptionWrap {
    x: Wrap;

    init() {
        self.x = Wrap{
            intOpt: null,
            boolOpt: null,
            strOpt: null
        };
    }
}