struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStorage {
    store: HasOptionals;

    init() {
        self.store = HasOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}
