struct HasString {
    s: String;
    sOpt: String?;
}

contract StrPers {
    rec: HasString;

    init() {
        self.rec = HasString{
            s: "abc",
            sOpt: "def",
        };
    }
}