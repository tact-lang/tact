struct EmptyStringDefaults {
    s1: String = "";
    s2: String = "";
    s3: String = "";
}

contract EmptyStrings {
    data: EmptyStringDefaults;

    init() {
        self.data = EmptyStringDefaults{};
    }
}