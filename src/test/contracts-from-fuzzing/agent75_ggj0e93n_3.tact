struct OptionalInner {
    x: Int?;
    y: Bool?;
}

contract Test {
    val: OptionalInner;

    init() {
        self.val = OptionalInner{
            x: null,
            y: true,
        };
    }
}