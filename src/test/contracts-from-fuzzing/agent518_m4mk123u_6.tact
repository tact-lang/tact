struct MixedOpt {
    s: String;
    n: Int;
    optStr: String?;
}

contract OptStringTest {
    content: MixedOpt;

    init() {
        self.content = MixedOpt{
            s: "required",
            n: 42,
            optStr: null,
        };
    }
}