struct OptionalInner {
    v: Int?;
    t: String?;
}

contract OptionalContract {
    optField: OptionalInner;

    init() {
        self.optField = OptionalInner{
            v: null,
            t: null
        };
    }
}