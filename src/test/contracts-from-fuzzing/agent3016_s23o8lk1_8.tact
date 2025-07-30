struct StringsAndOptional {
    s1: String;
    s2: String?;
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: StringsAndOptional;

    init() {
        self.data = StringsAndOptional{
            s1: "hello",
            s2: null,
            flag: true,
            num: 55
        };
    }
}