struct OptionalInner {
    n: Int;
}

struct OuterWithOpt {
    i: Int;
    nested: OptionalInner?;
}

contract TestContract {
    x: OuterWithOpt;

    init() {
        self.x = OuterWithOpt{
            i: 10,
            nested: null
        };
    }
}