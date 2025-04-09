struct Defaulted {
    count: Int = 5;
    flag: Bool = false;
}

contract DefaultsTest {
    conf: Defaulted;
    init() {
        self.conf = Defaulted{};
    }
}