struct HasEmptyOpt {
    foo: Int?;
}

contract EmptyOptInitTest {
    s: HasEmptyOpt;

    init() {
        self.s = HasEmptyOpt{};
    }
}
