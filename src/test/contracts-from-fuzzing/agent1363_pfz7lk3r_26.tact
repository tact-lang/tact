struct BigOptional {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract OptionalDefaultsOverride {
    val: BigOptional;

    init() {
        self.val = BigOptional{
            a: null,
            b: true,
            c: 123,
            d: null,
        };
    }
}