struct OptionalInner {
    a: Int?;
    b: String?;
}

contract OptionalInnerField {
    optInner: OptionalInner?;

    init() {
        self.optInner = OptionalInner{
            a: null,
            b: "present"
        };
    }
}