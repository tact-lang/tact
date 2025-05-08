struct DefaultedDeep {
    inn: Int = 5;
}

struct OuterWithDefInner {
    nested: DefaultedDeep = DefaultedDeep{};
}

contract DefaultedNestedTest {
    s: OuterWithDefInner;

    init() {
        self.s = OuterWithDefInner{};
    }
}