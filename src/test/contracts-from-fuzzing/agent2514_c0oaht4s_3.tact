struct OptVals {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptStructTest {
    opts: OptVals;

    init() {
        self.opts = OptVals{
            one: null,
            two: null,
            three: null,
        };
    }
}