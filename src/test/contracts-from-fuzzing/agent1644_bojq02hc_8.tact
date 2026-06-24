struct BoolAndOptional {
    flag: Bool;
    optionalName: String?;
}

contract MixedOptionals {
    entry: BoolAndOptional;

    init() {
        self.entry = BoolAndOptional{
            flag: false,
            optionalName: null
        };
    }
}