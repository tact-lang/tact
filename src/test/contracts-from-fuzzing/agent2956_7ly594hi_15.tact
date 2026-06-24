struct OptionalManyDiff {
    flag1: Bool?;
    flag2: Bool?;
    int1: Int?;
    int2: Int?;
    str1: String?;
    str2: String?;
}

contract MixedOpt {
    vals: OptionalManyDiff;

    init() {
        self.vals = OptionalManyDiff{
            flag1: null,
            flag2: null,
            int1: null,
            int2: null,
            str1: null,
            str2: null,
        };
    }
}
