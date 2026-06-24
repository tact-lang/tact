struct InnerMost { x: Int }
struct Middle {
    optIn: InnerMost?;
}
contract OptionalInnerField {
    middle: Middle;
    init() {
        self.middle = Middle{ optIn: null };
    }
}