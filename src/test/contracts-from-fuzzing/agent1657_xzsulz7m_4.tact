struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{a: 2, b: false, c: myAddress()};
    }
}