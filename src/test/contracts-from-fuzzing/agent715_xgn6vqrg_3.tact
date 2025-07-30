struct DefaultsTest {
    num: Int = 10;
    flag: Bool = true;
    txt: String = "hello";
}

contract TestContract {
    value: DefaultsTest;

    init() {
        self.value = DefaultsTest{};
    }
}