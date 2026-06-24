struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Builder?;
    g: Slice?;
}

contract ManyOptionalsTest {
    opt: ManyOptionalFields;

    init() {
        self.opt = ManyOptionalFields{
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