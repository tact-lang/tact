struct OptionalInner {
    comment: String?;
    flag: Bool;
}

contract OptionalNested {
    s: OptionalInner?;

    init() {
        self.s = OptionalInner{
            comment: null,
            flag: true
        };
    }
}
