struct OptionalWithinOptional {
    optInt: Int?;
    optBool: Bool?;
}

struct Wrap {
    innerOpt: OptionalWithinOptional?;
    caption: String;
}

contract OptionWrap {
    data: Wrap;
    init() {
        self.data = Wrap{
            innerOpt: null,
            caption: "test"
        };
    }
}
