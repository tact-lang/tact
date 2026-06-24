struct DefaultAndOption {
    a: Int = 10;
    b: Bool?;
    c: String = "default";
}

contract DefaultOptionTest {
    s: DefaultAndOption;

    init() {
        self.s = DefaultAndOption{
            b: null,
        };
    }
}