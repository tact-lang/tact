struct StringDefaults {
    s1: String = "hi";
    s2: String = "there";
    s3: String;
}

contract TestStringDefaults {
    val: StringDefaults;
    init() {
        self.val = StringDefaults{s3:"!"};
    }
}