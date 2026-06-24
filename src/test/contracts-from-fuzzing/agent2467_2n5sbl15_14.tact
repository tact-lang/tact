struct DeepOptional {
    innerOpt: Int?;
}

contract OptionInStructOpt {
    data: DeepOptional?;
    init() {
        self.data = null;
    }
}