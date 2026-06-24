struct DefaultLayer {
    a: Int = 1;
    b: Int = 2;
}

contract DefaultsFieldsTest {
    defaults: DefaultLayer;

    init() {
        self.defaults = DefaultLayer{ a: 11, b: 22 };
    }
}