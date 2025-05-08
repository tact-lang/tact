struct OptBigData {
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract OptionalBigDataTest {
    bd: OptBigData;

    init() {
        self.bd = OptBigData {
            s: null,
            c: null,
            sl: null
        };
    }
}