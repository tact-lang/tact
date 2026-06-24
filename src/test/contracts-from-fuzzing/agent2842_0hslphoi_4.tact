struct OptionalNested {
    inner: SecondLevel?;
}

struct SecondLevel {
    value: Int;
}

contract NestOptTest {
    store: OptionalNested;

    init() {
        self.store = OptionalNested{
            inner: SecondLevel{
                value: 10
            }
        };
    }
}