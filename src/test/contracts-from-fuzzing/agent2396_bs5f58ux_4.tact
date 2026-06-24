struct OptionalNest {
    inner: Bool?;
    num: Int?;
    text: String?;
}

contract HasOptionals {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: null,
            num: null,
            text: null
        };
    }
}