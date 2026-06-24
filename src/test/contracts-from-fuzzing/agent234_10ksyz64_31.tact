struct OptionalDefault {
    a: Int?;
    b: Int = 7;
}

contract OptDefaultTest {
    data: OptionalDefault;

    init() {
        self.data = OptionalDefault{
            a: null
        };
    }
}