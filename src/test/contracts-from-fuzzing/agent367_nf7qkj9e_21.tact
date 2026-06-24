struct STest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract VariedOptional {
    opt: STest;

    init() {
        self.opt = STest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}