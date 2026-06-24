struct Defaulted {
    x: Int = 1;
    y: String = "hi";
    z: Bool = false;
}

contract DefaultedTest {
    d: Defaulted = Defaulted{};

    receive() {
        self.d = Defaulted{};
    }
}