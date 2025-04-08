struct DeepOpt {
    a: Int?;
}

struct Wrap {
    o: DeepOpt?;
}

contract NestedOptionalTest {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{ o: null };
    }
}