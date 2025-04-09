struct BooleansAndStrings {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    text1: String;
    text2: String;
}

contract MixedTypesStorage {
    s: BooleansAndStrings;

    init() {
        self.s = BooleansAndStrings{
            flag1: true,
            flag2: false,
            flag3: true,
            text1: "hello",
            text2: "world"
        };
    }
}