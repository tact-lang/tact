struct WithOptionals {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptionalStructComposite {
    s: WithOptionals;

    init() {
        self.s = WithOptionals{
            val1: null,
            val2: null,
            val3: null,
        };
    }
}