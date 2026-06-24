struct DifferentDefaults {
    n: Int = 99;
    flag: Bool = false;
    text: String = "hi";
}

contract DefaultsTest {
    content: DifferentDefaults;

    init() {
        self.content = DifferentDefaults{};
    }
}