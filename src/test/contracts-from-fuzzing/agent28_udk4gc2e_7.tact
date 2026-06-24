struct OptionalMany {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Int?;
}

contract ManyOptTest {
    persistent: OptionalMany;

    init() {
        self.persistent = OptionalMany{
            a: null,
            b: null,
            c: true,
            d: null,
            e: 5,
        };
    }
}