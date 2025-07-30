struct DefaultAndNoDefault {
    a: Int = 1;
    b: Int;
}

contract DefaultMixedTest {
    field: DefaultAndNoDefault;

    init() {
        self.field = DefaultAndNoDefault{
            b: 42
        };
    }
}