struct IntsAndStrings {
    int1: Int;
    str1: String;
    int2: Int;
    str2: String;
    int3: Int;
    str3: String;
}

contract TestContract {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{
            int1: 1,
            str1: "one",
            int2: 2,
            str2: "two",
            int3: 3,
            str3: "three"
        };
    }
}