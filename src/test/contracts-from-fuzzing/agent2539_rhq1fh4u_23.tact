struct EmbedOpt {
   inner: Int?;
}

contract EmbedOptTest {
    data: EmbedOpt;

    init() {
        self.data = EmbedOpt{inner: 55};
    }
}