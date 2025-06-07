struct MultipleStringDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
}

contract StringDefaultsContract {
    data: MultipleStringDefaults;

    init() {
        self.data = MultipleStringDefaults{};
    }
}