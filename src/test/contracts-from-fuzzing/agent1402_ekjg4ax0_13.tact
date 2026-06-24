struct InnerStructDflt {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsTest {
    s: InnerStructDflt;

    init() {
        self.s = InnerStructDflt{};
    }
}