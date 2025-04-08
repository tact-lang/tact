struct NestedOptField {
    s: OptInner?;
}
struct OptInner {
    val: Int?;
}

contract PersistTwoNestedOpts {
    f: NestedOptField?;
    
    init() {
        self.f = null;
    }
}