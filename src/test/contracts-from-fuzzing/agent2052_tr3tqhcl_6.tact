contract NoDefaultsTest {
    number: Int;
    message: String;

    init() {
        self.number = 777;
        self.message = "abc";
    }
}