struct HasBoolOpt {
    b: Bool?;
}

contract OnlyOneOptional {
    var: HasBoolOpt;

    init() {
        self.var = HasBoolOpt{b: null};
    }
}