struct ContainsSliceOptional {
    s: Slice?;
}

contract OptionalSliceField {
    foo: ContainsSliceOptional;

    init() {
        self.foo = ContainsSliceOptional{ s: null };
    }
}