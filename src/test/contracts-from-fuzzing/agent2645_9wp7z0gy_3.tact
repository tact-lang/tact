struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTest {
    state: WithOptionals;

    init() {
        self.state = WithOptionals{
            a: null,
            b: true,
            c: null,
        };
    }
}
