struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalFields {
    val: Opts;
    init() {
        self.val = Opts{a: null, b: null, c: null, d: null};
    }
}