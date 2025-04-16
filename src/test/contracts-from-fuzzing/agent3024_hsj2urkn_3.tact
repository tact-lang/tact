struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalTest {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{foo: null, bar: true, baz: null};
    }
}
