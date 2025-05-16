struct StringsMix {
    s1: String;
    s2: String;
    oa: Address?;
    oi: Int?;
}

contract MultiStrings {
    m: StringsMix;

    init() {
        self.m = StringsMix{
            s1: "Hello",
            s2: "世界",
            oa: null,
            oi: 999
        };
    }
}