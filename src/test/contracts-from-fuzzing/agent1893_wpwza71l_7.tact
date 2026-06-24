struct Defaulted {
    x: Int = 1;
    y: Bool = true;
    s: String = "hello";
}

contract DefaultsTest {
    myVal: Defaulted;

    init() {
        self.myVal = Defaulted{};
    }
}