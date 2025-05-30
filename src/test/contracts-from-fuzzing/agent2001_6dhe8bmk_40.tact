struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalsOfStrings {
    v: OptionalStrings;

    init() {
        self.v = OptionalStrings{
            s1:null,s2:null,s3:null
        };
    }
}