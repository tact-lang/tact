struct HasStringOpt {
    info: String?;
    val: Int;
}

contract OptStringTest {
    s: HasStringOpt;
    init() {
        self.s = HasStringOpt{
            info: null,
            val: 123,
        };
    }
}