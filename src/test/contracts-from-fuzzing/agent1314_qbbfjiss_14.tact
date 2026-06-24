struct OptionalsInDeeper {
    name: String?;
    age: Int?;
    active: Bool;
}

contract ChainOptionals {
    rec: OptionalsInDeeper;

    init() {
        self.rec = OptionalsInDeeper{
            name: null,
            age: null,
            active: false,
        };
    }
}