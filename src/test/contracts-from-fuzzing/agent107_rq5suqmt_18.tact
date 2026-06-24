struct EmbeddedOpt {
    s1: Int?;
    s2: Bool;
}

contract EmbeddedOptTest {
    s: EmbeddedOpt;
    init() {
        self.s = EmbeddedOpt{ s1: null, s2: true };
    }
}