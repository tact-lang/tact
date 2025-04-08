struct Leaf {
    value: Int;
}

struct MiddleOpt {
    leaf: Leaf?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract DeepOptionalsTest {
    target: OuterOpt;

    init() {
        self.target = OuterOpt{
            middle: null,
        };
    }
}