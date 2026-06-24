struct OptionalInner {
    x: Int?;
}

struct OuterWrap {
    y: Bool;
    z: OptionalInner?;
}

contract TestContract {
    stored: OuterWrap;

    init() {
        self.stored = OuterWrap{
            y: true,
            z: null
        };
    }
}