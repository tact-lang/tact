struct OptionInDeep {
    level: Int?;
}

struct Container {
    cont: OptionInDeep;
}

contract HasOptionalNested {
    val: Container;

    init() {
        self.val = Container{ cont: OptionInDeep{ level: null } };
    }
}