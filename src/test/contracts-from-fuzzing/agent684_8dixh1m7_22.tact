struct BigOptional {
    x: Int?;
    y: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract BigOptionalTest {
    bigOpt: BigOptional?;
    init() {
        self.bigOpt = null;
    }
}