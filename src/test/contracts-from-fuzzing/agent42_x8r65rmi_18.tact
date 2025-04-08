struct UnusualOrder {
    s: String;
    b: Bool;
    a: Int;
}
contract TestContract {
    field: UnusualOrder;
    init() {
        self.field = UnusualOrder{ s: "x", b: true, a: 42 };
    }
}