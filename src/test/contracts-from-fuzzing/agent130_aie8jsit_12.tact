struct NestedDeepOpt {
    x: Int?;
}

struct OuterOpt2 {
    nested: NestedDeepOpt?;
}

contract NestedOptTest {
    state: OuterOpt2?;

    init() {
        self.state = null;
    }
}