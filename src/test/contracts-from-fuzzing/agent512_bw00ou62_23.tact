struct BoolAndOptionals {
    flag: Bool;
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract BoolOptionalMixTest {
    data: BoolAndOptionals;

    init() {
        self.data = BoolAndOptionals{
            flag: true,
            maybeInt: null,
            maybeBool: null
        };
    }
}