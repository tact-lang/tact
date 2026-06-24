struct OptionalDeep {
    inner: Int?;
}

struct OptionalContainer {
    nested: OptionalDeep?;
}

contract DeepOptional {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{ nested: null };
    }
}