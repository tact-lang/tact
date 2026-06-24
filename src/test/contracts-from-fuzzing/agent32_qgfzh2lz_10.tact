struct BoolNest { inner: Bool? }

contract OptionalBoolNested {
    field: BoolNest?;

    init() {
        self.field = null;
    }
}
