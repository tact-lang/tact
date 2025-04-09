// optional at top level struct with nested value
struct InnerVal {
    foo: Int;
}
struct TopOpt {
    inner: InnerVal?;
    s: String;
}

contract OptionalInTop {
    data: TopOpt;

    init() {
        self.data = TopOpt{ inner: null, s:"hi" };
    }
}