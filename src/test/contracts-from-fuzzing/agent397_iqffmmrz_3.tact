struct OptionalDeep {
    nested: NestedOpt?;
}

struct NestedOpt {
    value: Int?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{ nested: null };
    }
}