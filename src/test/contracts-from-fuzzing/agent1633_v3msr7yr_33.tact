struct WithOptionals {
    a: Int?;
    b: Bool?;
}

struct Holder {
    inner: WithOptionals;
}

contract NestedOptStructTest {
    s: Holder;

    init() {
        self.s = Holder{
            inner: WithOptionals{ a: null, b: null }
        };
    }
}