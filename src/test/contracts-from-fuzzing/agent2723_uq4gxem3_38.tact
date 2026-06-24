struct DeepOptWrap {
    innerOpt: Int?;
}

contract OptionalDeepWrap {
    val: DeepOptWrap?;
    init() {
        self.val = DeepOptWrap{ innerOpt: 42 };
    }
}