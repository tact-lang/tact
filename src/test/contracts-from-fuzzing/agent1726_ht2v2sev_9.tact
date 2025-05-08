struct WithStrings {
    s1: String;
    s2: String = "hello";
    s3: String?;
    s4: String? = null;
}

contract StringsHolder {
    s: WithStrings;
    init() {
        self.s = WithStrings{
            s1:"abc",
            s3:null
        };
    }
}