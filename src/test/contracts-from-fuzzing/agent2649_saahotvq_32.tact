struct EmptyInner {
    a: Int;
}

struct WithEmptyOption {
    e: EmptyInner?;
}

contract EmptyOptionalTest {
    state: WithEmptyOption;

    init() {
        self.state = WithEmptyOption{
            e: null,
        };
    }
}