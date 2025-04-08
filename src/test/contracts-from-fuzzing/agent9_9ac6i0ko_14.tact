struct OptionalString {
    s: String?;
}

struct Layer {
    nested: OptionalString?;
}

contract OptionalInOptionalInStruct {
    data: Layer = Layer{ nested: null };

    init() {
        self.data = Layer{ nested: OptionalString{ s: null } };
    }
}