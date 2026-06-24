struct DefaultOption {
    a: Int? = null;
}
contract DefaultOptionTest {
    d: DefaultOption;

    init() {
        self.d = DefaultOption{};
    }
}
