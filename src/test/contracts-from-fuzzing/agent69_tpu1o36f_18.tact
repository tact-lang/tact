struct Layer3 {
    d: Int;
    e: Bool;
}
struct Layer2 {
    b: Layer3;
    c: String?;
}
contract NestedDirect {
    inner: Layer2;
    init() {
        self.inner = Layer2{
            b: Layer3{
                d: 1,
                e: false
            },
            c: null
        };
    }
}