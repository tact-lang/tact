struct StringHeavy {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestContract {
    textdata: StringHeavy;

    init() {
        self.textdata = StringHeavy{
            s1: "abc",
            s2: "def",
            s3: "ghi",
            s4: "jkl"
        };
    }
}
