struct NestedField {
    val: Int;
}

struct OuterWithOption {
    nested: NestedField?;
    flag: Bool;
}

contract NestedOptionTest {
    val: OuterWithOption;

    init() {
        self.val = OuterWithOption{
            nested: null,
            flag: true
        };
    }
}
