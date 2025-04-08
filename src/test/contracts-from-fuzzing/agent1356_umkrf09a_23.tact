struct DefaultsMix {
    a: Int = 5;
    b: Bool;
    c: String = "hi";
    d: Int? = null;
    e: Bool?;
}

contract PartialDefaults {
    s: DefaultsMix;

    init() {
        self.s = DefaultsMix{
            b: false,
            e: null,
        };
    }
}
