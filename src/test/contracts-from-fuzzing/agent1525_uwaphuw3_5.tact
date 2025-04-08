struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
}

contract MixOptionalsTest {
    opts: DeepOptionals;

    init() {
        self.opts = DeepOptionals{
            a: 10,
            c: null
        };
    }
}