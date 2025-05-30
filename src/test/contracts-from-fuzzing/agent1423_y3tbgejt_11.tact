struct DeepOptional {
    val: Int?;
}

contract OptionalDefault {
    opt: DeepOptional;
    init() {
        self.opt = DeepOptional{ val: null };
    }
}