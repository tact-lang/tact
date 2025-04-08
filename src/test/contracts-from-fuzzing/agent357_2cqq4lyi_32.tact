// Deep optional chain with remaining nested
struct ContainsNestedRemOpt {
    nested: RemOpt?;
}

struct RemOpt {
    head: Int;
    suffix: Slice as remaining;
}

contract DeepOptionalRemaining {
    value: ContainsNestedRemOpt;

    init() {
        self.value = ContainsNestedRemOpt{
            nested: null,
        };
    }
}