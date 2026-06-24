struct OptionalInner {
    x: Int?;
    y: Bool?;
}

contract OptionalManyInner {
    param: OptionalInner;

    init() {
        self.param = OptionalInner { x: null, y: null };
    }
}