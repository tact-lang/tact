struct HasOptionals {
    n: Int?;
    s: String?;
}

contract NestedOptionalsTest {
    field: HasOptionals;

    init() {
        self.field = HasOptionals{ n: null, s: null };
    }
}