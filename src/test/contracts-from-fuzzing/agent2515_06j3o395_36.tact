struct DefOpt {
    foo: Int = 5;
    bar: String?;
}

contract MixedDefaultOptional {
    field: DefOpt;
    init() {
        self.field = DefOpt{
            foo: 12,
            bar: "hi"
        };
    }
}
