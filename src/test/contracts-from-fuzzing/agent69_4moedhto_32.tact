struct OptionalWithDefault {
    a: Int? = null;
    b: Int?;
}

contract OptionalWithDefaultTest {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{
            b: null
        };
    }
}