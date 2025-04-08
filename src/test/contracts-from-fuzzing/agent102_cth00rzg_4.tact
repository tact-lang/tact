struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructStorage {
    s: HasOptionals;

    init() {
        self.s = HasOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}