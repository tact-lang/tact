struct OptInner {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalFields {
    data: OptInner;

    init() {
        self.data = OptInner{optInt: null, optBool: true};
    }
}