trait TraitWithOptional {
    myOpt: Int?;
}

contract TraitOptionalContract with TraitWithOptional {
    myOpt: Int?;

    init() {
        self.myOpt = null;
    }
}