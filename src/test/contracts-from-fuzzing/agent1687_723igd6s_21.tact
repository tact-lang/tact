struct Defaulted {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsTest {
    df: Defaulted;

    init() {
        self.df = Defaulted{};
    }
}