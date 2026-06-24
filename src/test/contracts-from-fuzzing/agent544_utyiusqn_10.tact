struct OptionalSerializeTest {
    a: Int? as int16;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    opt: OptionalSerializeTest;

    init() {
        self.opt = OptionalSerializeTest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}