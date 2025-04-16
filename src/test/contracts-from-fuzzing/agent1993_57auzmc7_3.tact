struct OptionalNested {
    nested_value: Int?;
}

contract TestContract {
    optNest: OptionalNested;

    init() {
        self.optNest = OptionalNested{ nested_value: null };
    }
}