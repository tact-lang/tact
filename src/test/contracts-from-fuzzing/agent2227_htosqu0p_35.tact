struct SomeNesting {
    x: Int;
}

struct MoreNesting {
    s: SomeNesting;
}

contract InitNestedFields {
    val: MoreNesting;

    init() {
        self.val = MoreNesting{ s: SomeNesting{ x: 11 } };
    }
}