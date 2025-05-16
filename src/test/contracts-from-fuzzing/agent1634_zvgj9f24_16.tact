struct NestedWithOption {
    innerField: Int?;
}

struct OuterWithOption {
    nested: NestedWithOption?;
    b: Bool;
}

contract NestedOptionStructContract {
    s: OuterWithOption;

    init() {
        self.s = OuterWithOption{ nested: null, b: true };
    }
}