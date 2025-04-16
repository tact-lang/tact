struct Opts {
    intval: Int?;
    boolval: Bool?;
    strval: String?;
    addrval: Address?;
}

contract OptionalFields {
    data: Opts;

    init() {
        self.data = Opts{
            intval: null,
            boolval: null,
            strval: null,
            addrval: null,
        };
    }
}
