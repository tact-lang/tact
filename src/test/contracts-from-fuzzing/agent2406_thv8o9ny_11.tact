struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStringStore {
    os: OptionalStrings;

    init() {
        self.os = OptionalStrings{ s1:null, s2:"abc", s3:null };
    }
}