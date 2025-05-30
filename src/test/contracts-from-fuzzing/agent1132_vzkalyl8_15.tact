struct DeepOptional {
    innerOpt: String?;
    flagOpt: Bool?;
}

contract OptionInit {
    state: DeepOptional;

    init() {
        self.state = DeepOptional{
            innerOpt: null,
            flagOpt: true
        };
    }
}