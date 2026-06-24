struct OptionalFields {
    flag: Bool?;
    count: Int?;
}

contract TestOptionals {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{ flag: null, count: null };
    }
}