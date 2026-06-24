struct OptionalInsideOptional {
    innerOpt: Bool?;
}

contract OptionalStructInOptional {
    val: OptionalInsideOptional?;

    init() {
        self.val = null;
    }
}