struct HasOpt {
    s: String?;
    b: Bool?;
}

contract OptionalFields {
    data: HasOpt;

    init() {
        self.data = HasOpt{s: null, b: null};
    }
}
