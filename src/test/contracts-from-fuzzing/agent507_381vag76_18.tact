struct OptionStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract TestContract {
    optstr: OptionStrings;

    init() {
        self.optstr = OptionStrings{
            s1:null, s2:null, s3:null
        };
    }
}