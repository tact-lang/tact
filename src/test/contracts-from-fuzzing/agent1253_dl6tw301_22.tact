struct LotsOptStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract OptStrPersistent {
    val: LotsOptStrings;

    init() {
        self.val = LotsOptStrings{
            s1: null, s2: "a", s3: null, s4: "b", s5: null
        };
    }

    receive() {}
}