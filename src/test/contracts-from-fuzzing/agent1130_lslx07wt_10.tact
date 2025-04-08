struct Inner { x: Int; y: Bool; opt: Int?; }

contract DeepOptionalField {
    optInner: Inner?;

    init() {
        self.optInner = null;
    }
}