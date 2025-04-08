struct MixedOptional {
    requiredVal: Int = 5;
    maybeBool: Bool?;
    maybeText: String?;
}

contract MixedOptionalTest {
    m: MixedOptional;

    init() {
        self.m = MixedOptional{
            requiredVal: 5,
            maybeBool: null,
            maybeText: null
        };
    }
}
