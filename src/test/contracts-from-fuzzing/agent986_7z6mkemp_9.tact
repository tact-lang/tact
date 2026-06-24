struct HasOptional {
    a: Int;
    b: Bool?;
}

contract OptionStruct {
    s: HasOptional;

    init() {
        self.s = HasOptional{ a: 10, b: null };
    }
}
