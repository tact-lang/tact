struct OptionalSer2 {
    val1: Int? as uint16;
    val2: String?;
    val3: Bool?;
}

contract OptMultiFields {
    f: OptionalSer2;

    init() {
        self.f = OptionalSer2{ val1: 11, val2: null, val3: true };
    }
}