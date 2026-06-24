struct MixedOpt {
    s: String;
    c: Cell?;
    sl: Slice?;
    addr: Address?;
    b: Bool;
    n: Int;
}

contract MixedOptTest {
    store: MixedOpt;

    init() {
        self.store = MixedOpt{
            s: "",
            c: null,
            sl: null,
            addr: null,
            b: false,
            n: 0
        };
    }
}