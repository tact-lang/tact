struct BoolLayer {
    val: Bool;
}

struct OptionalBoolLayer {
    inner: BoolLayer?;
}

contract OptBoolField {
    data: OptionalBoolLayer;

    init() {
        self.data = OptionalBoolLayer{ inner: null };
    }
}