struct HasNullables {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract NullableAll {
    vals: HasNullables;
    init() {
        self.vals = HasNullables{
            s: null,
            b: null,
            i: null
        };
    }
}
