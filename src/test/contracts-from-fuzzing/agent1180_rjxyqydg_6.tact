struct HasOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract MixedOptionalsTest {
    x: HasOptionals;

    init() {
        self.x = HasOptionals{
            a: null,
            b: null,
            c: true,
        };
    }
}
