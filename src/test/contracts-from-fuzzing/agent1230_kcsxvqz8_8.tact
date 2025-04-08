struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NestedOptionalsContract {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            a: null,
            b: null,
            c: true
        };
    }
}