struct OptionalFancyFields {
    a: Int? as uint8;
    b: Int? as int64;
    c: Int? as uint256;
}

contract OptionalFancyFieldsContract {
    f: OptionalFancyFields;

    init() {
        self.f = OptionalFancyFields{
            a: null,
            b: null,
            c: null
        };
    }
}
