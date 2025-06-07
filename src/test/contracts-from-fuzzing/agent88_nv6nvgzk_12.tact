struct NestedOpt {
    address: Address?;
    inner: Int?;
}

contract TestContract {
    s: NestedOpt?;

    init() {
        self.s = null;
    }
}