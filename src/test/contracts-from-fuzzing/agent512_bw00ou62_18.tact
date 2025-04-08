struct EmbeddedOptional {
    inner: Int?;
}

struct Wrap {
    embedded: EmbeddedOptional?;
}

contract WrapOptTest {
    data: Wrap;

    init() {
        self.data = Wrap{
            embedded: null
        };
    }
}
