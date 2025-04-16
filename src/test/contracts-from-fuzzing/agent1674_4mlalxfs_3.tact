struct HasOptional {
    val: Int?;
    active: Bool;
}

contract OptionalFields {
    optdata: HasOptional;

    init() {
        self.optdata = HasOptional{ val: null, active: true };
    }
}