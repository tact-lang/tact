struct OptionalStringLayer {
    text: String?;
}

struct OptionalWrap {
    layer: OptionalStringLayer?;
}

contract OptionalStructOptField {
    content: OptionalWrap;

    init() {
        self.content = OptionalWrap{ layer: null };
    }
}