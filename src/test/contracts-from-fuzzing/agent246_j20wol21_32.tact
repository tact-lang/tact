struct OptNested {
    s: OptInner?;
}
struct OptInner {
    a: Int;
    b: Int?;
}
contract OptChain {
    d: OptNested;

    init() {
        self.d = OptNested{
            s: OptInner{
                a: 42,
                b: null,
            }
        };
    }
}