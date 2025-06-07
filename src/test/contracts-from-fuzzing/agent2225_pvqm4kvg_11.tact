struct IntsAndStrings {
    int1: Int;
    int2: Int;
    str1: String;
    str2: String;
    int3: Int?;
    str3: String;
}

contract MixedOptional {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{
            int1: 1,
            int2: 2,
            str1: "a",
            str2: "b",
            int3: null,
            str3: "c"
        };
    }
}