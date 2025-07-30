struct OptTest {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: String?;
}

contract OptStorage {
    optData: OptTest;

    init() {
        self.optData = OptTest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}