struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultedTest {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}