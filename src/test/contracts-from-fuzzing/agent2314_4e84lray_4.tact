struct OptOptOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOptionalFields {
    payload: OptOptOpt;
    init() {
        self.payload = OptOptOpt{
            a: null,
            b: true,
            c: null
        };
    }
}