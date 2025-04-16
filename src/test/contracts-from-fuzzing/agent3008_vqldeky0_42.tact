struct DualOptionals {
    x: Int?;
    y: String?;
}

contract StructOptionalField {
    entry: DualOptionals?;

    init() {
        self.entry = null;
    }
}