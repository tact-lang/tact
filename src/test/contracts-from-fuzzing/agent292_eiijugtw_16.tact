struct IntsAndStrings {
    int1: Int;
    int2: Int;
    str1: String;
    str2: String;
    flag: Bool;
}

contract MixedPrimitives {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{
            int1: 123,
            int2: 456,
            str1: "hello",
            str2: "world",
            flag: true
        };
    }
}