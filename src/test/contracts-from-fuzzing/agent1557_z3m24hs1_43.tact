// Test string field with default
struct StringDefaults {
    a: String = "hello";
    b: String;
}

contract StringDefaultsTest {
    data: StringDefaults;

    init() {
        self.data = StringDefaults{ b: "world" };
    }
}