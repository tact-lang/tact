struct OptionalDeep {
    val: Int;
    note: String;
}

struct WithOptionals {
    a: OptionalDeep?;
    b: Int?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptionalsStructTest {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}