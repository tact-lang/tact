struct DefaultsWithOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    quux: Int = 999;
}

contract DefaultsWithOptionalsContract {
    data: DefaultsWithOptionals;

    init() {
        self.data = DefaultsWithOptionals{
            foo: null,
            bar: null,
            baz: null,
            quux: 999
        };
    }
}
