struct NullablesWithDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullablesDefaultsInit {
    data: NullablesWithDefaults;
    init() {
        self.data = NullablesWithDefaults{
            a: null,
            b: null,
            c: null
        };
    }
}