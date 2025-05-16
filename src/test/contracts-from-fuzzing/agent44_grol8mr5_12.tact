struct OptionalAll {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalDefaultsContract {
    data: OptionalAll;

    init() {
        self.data = OptionalAll{
            a: null,
            b: null,
            c: null,
        };
    }
}