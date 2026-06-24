struct OptionalInner {
    x: Int?;
    y: Int?;
}

contract OptNested {
    val: OptionalInner;

    init() {
        self.val = OptionalInner{
            x: 10,
            y: null
        };
    }
}