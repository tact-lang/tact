struct NestedWithOptionals {
    inner: Int?;
}

struct NestedWithOptionals2 {
    nested: NestedWithOptionals?;
}

contract NestedOptionalsFields {
    data: NestedWithOptionals2;

    init() {
        self.data = NestedWithOptionals2{
            nested: null
        };
    }
}