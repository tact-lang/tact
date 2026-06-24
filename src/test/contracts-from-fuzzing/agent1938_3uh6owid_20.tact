struct TextDefaults {
    s1: String = "x";
    s2: String = "y";
    s3: String = "z";
}

contract TextDefaultsTest {
    data: TextDefaults;

    init() {
        self.data = TextDefaults{};
    }
}