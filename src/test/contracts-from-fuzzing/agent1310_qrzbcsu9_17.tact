struct OptionalInNested {
    nested: Inner?;
}

struct Inner {
    value: Int?;
}

contract OptionalNested {
    s: OptionalInNested;
    init() {
        self.s = OptionalInNested{
            nested: null
        };
    }
}