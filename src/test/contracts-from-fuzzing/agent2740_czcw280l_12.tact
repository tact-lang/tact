struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptsStorage {
    field: ManyOpts;

    init() {
        self.field = ManyOpts{
            a: null,
            b: null,
            c: null
        };
    }
}