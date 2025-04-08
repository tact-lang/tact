struct HasOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptionalsDefaults {
    data: HasOptional;

    init() {
        self.data = HasOptional{
            foo: null,
            bar: null,
        };
    }
}