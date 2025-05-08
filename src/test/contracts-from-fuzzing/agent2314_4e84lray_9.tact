struct StringCombos {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}
contract TestOptionalStrings {
    val: StringCombos;
    init() {
        self.val = StringCombos{
            s1: "x",
            s2: null,
            s3: "y",
            s4: "z"
        };
    }
}