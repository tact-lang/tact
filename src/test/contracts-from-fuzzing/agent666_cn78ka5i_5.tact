struct OptionNest {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptField {
    opts: OptionNest;

    init() {
        self.opts = OptionNest{
            val1: null,
            val2: true,
            val3: null
        };
    }
}
