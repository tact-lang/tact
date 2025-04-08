struct NestedOptionals {
    i: Int?;
    b: Bool?;
}

contract NestedOptionalsContract {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{ i: null, b: null };
    }
}