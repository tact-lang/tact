struct OptionalSerialize {
    a: Int? as int4;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract NestedSerOptTest {
    nested: OptionalSerialize;

    init() {
        self.nested = OptionalSerialize{
            a: 7,
            b: null,
            c: "hi",
            d: null
        };
    }
}