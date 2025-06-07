struct InnerOut {
    a: Int;
}

contract OptContractField {
    inner: InnerOut?;

    init() {
        self.inner = null;
    }
}