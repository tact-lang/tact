struct StringDefaults {
    s1: String = "one";
    s2: String = "two";
    s3: String = "three";
}

contract TestStringDefaults {
    data: StringDefaults;

    init() {
        self.data = StringDefaults{};
    }
}