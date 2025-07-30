struct OptionalOuter {
    nested: OptionalMiddle?;
}

struct OptionalMiddle {
    nested: OptionalInner?;
}

struct OptionalInner {
    value: Int?;
}

contract MultipleLayerOptionals {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{ nested: null };
    }
}
