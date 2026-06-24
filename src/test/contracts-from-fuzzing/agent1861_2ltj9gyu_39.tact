struct EmbedOpt {
    a: Int?;
    b: Bool?;
}

contract EmbedOptTest {
    data: EmbedOpt;

    init() {
        self.data = EmbedOpt{
            a: null,
            b: null
        };
    }
}