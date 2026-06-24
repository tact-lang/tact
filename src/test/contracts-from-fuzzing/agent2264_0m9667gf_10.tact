struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract EmbeddedOptTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
