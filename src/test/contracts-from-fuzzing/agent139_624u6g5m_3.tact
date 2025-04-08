struct OptionalInner {
    v1: Int?;
    v2: String?;
}

contract OptionalFieldsContract {
    opt: OptionalInner;

    init() {
        self.opt = OptionalInner{ v1: null, v2: null };
    }
}