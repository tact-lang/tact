struct OptInner {
    val: Int?;
}

contract TestContract {
    nested: OptInner?;
    init() {
        self.nested = null;
    }
}