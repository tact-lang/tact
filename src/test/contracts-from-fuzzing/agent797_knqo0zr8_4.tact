struct NestedOptional {
    innerOpt: Bool?; 
}

contract OptionInStructOpt {
    field: NestedOptional?;

    init() {
        self.field = null;
    }
}
