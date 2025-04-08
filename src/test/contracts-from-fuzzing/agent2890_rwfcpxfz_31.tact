struct OptionalAsBits {
    a: Int?;
    b: Bool?;
}

contract OptAsBitsTest {
    s: OptionalAsBits;

    init() {
        self.s = OptionalAsBits{
            a:null,
            b:null
        };
    }
}