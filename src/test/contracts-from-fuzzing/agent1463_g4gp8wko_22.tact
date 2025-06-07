struct SDefaultsMixed {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsMixedTest {
    s: SDefaultsMixed;

    init() {
        self.s = SDefaultsMixed{};
    }
}
