struct OptionalStuff {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionTest {
    stuff: OptionalStuff;
    init() {
        self.stuff = OptionalStuff{ a: null, b: true, c: null };
    }
}