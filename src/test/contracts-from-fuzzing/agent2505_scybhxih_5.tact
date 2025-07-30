struct Optionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalFields {
    data: Optionals;

    init() {
        self.data = Optionals{ intOpt: null, boolOpt: null, stringOpt: null };
    }
}