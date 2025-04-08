struct ConstantsTest {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract WithDefaults {
    data: ConstantsTest;

    init() {
        self.data = ConstantsTest{};
    }
}