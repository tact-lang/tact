struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStorage {
    data: HasOptionals;

    init() {
        self.data = HasOptionals{
            a: null,
            b: null,
            c: null
        };
    }
}