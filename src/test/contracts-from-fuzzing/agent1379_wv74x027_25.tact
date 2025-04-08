struct EmptyDefaultsOptional {
    a: Int?;
    b: Bool?;
}

contract OptionalEmptyDefaults {
    s: EmptyDefaultsOptional;

    init() {
        self.s = EmptyDefaultsOptional{
            a: null,
            b: null,
        };
    }
}
