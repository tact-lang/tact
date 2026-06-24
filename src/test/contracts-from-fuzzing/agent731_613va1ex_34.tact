struct HasMany {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract ManyMixed {
    data: HasMany;

    init() {
        self.data = HasMany{
            i: 1, b: true, s: "s",
            oi: null, ob: null, os: null
        };
    }
}