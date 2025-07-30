struct HasStringAndOptionals {
    a: String = "foo";
    b: Int?;
    c: String?;
    d: Bool;
}

contract MixStrOpt {
    s: HasStringAndOptionals;

    init() {
        self.s = HasStringAndOptionals{
            d: true
        };
    }
}
