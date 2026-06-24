struct HasManyOptionals {
    intOpt1: Int?;
    intOpt2: Int?;
    boolOpt: Bool?;
    textOpt: String?;
}

contract OptFields {
    optStore: HasManyOptionals;
    init() {
        self.optStore = HasManyOptionals{
            intOpt1: null,
            intOpt2: null,
            boolOpt: null,
            textOpt: null
        };
    }
}