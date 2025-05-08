struct InnerMost {
    d: Int?;
}
struct Inner {
    c: InnerMost?;
}
contract TestContract {
    outer: Inner?;

    init() {
        self.outer = Inner{ c: null };
    }
}