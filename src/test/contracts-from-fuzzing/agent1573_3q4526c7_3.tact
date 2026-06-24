struct OptionalNested {
    value: Int?;
}

contract TestContract {
    optionalNested: OptionalNested;

    init() {
        self.optionalNested = OptionalNested{ value: null };
    }
}