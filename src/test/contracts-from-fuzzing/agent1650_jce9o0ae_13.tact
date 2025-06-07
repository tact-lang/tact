struct HasOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalDefaults {
    field: HasOpt;

    init() {
        self.field = HasOpt{}; // default nulls
    }
}