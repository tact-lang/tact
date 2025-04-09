struct OnlyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}
contract DefStructTest {
    val: OnlyDefaults;
    init() {
        self.val = OnlyDefaults{};
    }
}