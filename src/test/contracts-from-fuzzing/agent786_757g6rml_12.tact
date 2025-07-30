struct OptionalStringSlice {
    a: String?;
    b: Slice?;
}

contract MixedNulls {
    f: OptionalStringSlice;

    init() {
        self.f = OptionalStringSlice{
            a: null,
            b: null
        };
    }
}