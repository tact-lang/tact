struct OptionTest {
    x: Int?;
    b: Bool?;
}

contract OptContract {
    val: OptionTest = OptionTest{};

    init() {
        self.val = OptionTest{x: null, b: true};
    }
}