struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

contract NestedStructTest {
    data: Inner;

    init() {
        self.data = Inner{a: 42, b: true, c: myAddress()};
    }
}
