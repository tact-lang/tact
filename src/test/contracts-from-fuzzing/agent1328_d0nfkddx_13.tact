struct STest {
    flag: Bool = true;
    number: Int = 42;
    text: String = "default";
}

contract Defaults {
    s: STest;
    init() {
        self.s = STest{};
    }
}