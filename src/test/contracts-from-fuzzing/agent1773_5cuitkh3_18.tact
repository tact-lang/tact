struct HasDefault {
    a: Int = 0;
    b: Bool = false;
}

contract DefaultStructFieldTest {
    x: HasDefault;

    init() {
        self.x = HasDefault{};
    }
}