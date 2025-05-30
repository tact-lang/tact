struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

contract TestContract {
    info: Inner;

    init() {
        self.info = Inner{a: 5, b: true, c: myAddress()};
    }
}