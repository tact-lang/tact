struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptionalStringsHolder {
    field: OptionalStrings;

    init() {
        self.field = OptionalStrings{s1:null,s2:null,s3:null};
    }
}