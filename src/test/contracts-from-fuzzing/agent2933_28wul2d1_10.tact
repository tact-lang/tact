struct Inner {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultsTest {
    data: Inner;

    init() {
        self.data = Inner{};
    }
}