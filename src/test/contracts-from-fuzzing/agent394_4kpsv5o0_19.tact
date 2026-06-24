struct OptionalPrimitive {
    val: Int?;
}

contract OptionInStructOpt {
    s: OptionalPrimitive?;
    init() {
        self.s = null;
    }
}