struct OptionalInner {
    x: Int?;
    y: Bool?;
}

contract OptFields {
    val: OptionalInner;

    init() {
        self.val = OptionalInner{
            x: null,
            y: true
        };
    }
}