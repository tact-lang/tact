struct OptionalStructs {
    s1: Int?;
    s2: Bool?;
    s3: Int?;
}

struct HasOptionalNested {
    nested: OptionalStructs?;
}

contract TopLevelOptNested {
    data: HasOptionalNested;

    init() {
        self.data = HasOptionalNested{
            nested: null
        };
    }
}