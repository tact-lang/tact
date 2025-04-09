struct OptLeaf {
    val: Int?;
}

struct Middle {
    one: OptLeaf?;
}

contract OptionInOption {
    nested_opt: Middle?;

    init() {
        self.nested_opt = null;
    }
}