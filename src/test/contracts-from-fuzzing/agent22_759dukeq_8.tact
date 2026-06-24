struct WithStringOpt {
    s: String?;
    flag: Bool;
}

contract OptionalStringTest {
    data: WithStringOpt;

    init() {
        self.data = WithStringOpt{
            s: null,
            flag: true,
        };
    }
}
