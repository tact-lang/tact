struct OptionalInner {
    a: Int;
    b: Int?;
}

contract OptionalStruct {
    val: OptionalInner?;

    init() {
        self.val = OptionalInner{
            a: 42,
            b: null
        };
    }
}