struct Inner {
    num: Int = 123;
}

contract DefaultInnerTest {
    field: Inner;

    init() {
        self.field = Inner{};
    }
}
