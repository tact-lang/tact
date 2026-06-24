struct BigOptional {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalMixPersist {
    content: BigOptional;

    init() {
        self.content = BigOptional{
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}