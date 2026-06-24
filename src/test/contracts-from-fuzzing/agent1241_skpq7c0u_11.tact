struct OptStru {
    val: Int?;
}

struct HasOpt {
    inner: OptStru?;
    flag: Bool;
}

contract OptStructTest {
    state: HasOpt;

    init() {
        self.state = HasOpt{
            inner: null,
            flag: true,
        };
    }
}
