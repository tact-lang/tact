struct OptionalInner {
    v: Int?;
    b: Bool?;
}

contract OptionalStructContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            v: null,
            b: null,
        };
    }
}