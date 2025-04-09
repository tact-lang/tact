struct HasOptionals {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructStorage {
    s: HasOptionals;

    init() {
        self.s = HasOptionals{
            foo: null,
            bar: true,
        };
    }
}