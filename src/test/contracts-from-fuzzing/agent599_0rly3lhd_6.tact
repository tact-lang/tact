struct OptTuple {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    opts: OptTuple;

    init() {
        self.opts = OptTuple{ a: null, b: null, c: null };
    }
}