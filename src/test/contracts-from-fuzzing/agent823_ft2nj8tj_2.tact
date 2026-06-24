struct Inner {
    x: Int;
    y: Bool;
    z: Address;
}

contract NestedFields {
    data: Inner;

    init() {
        self.data = Inner{ x: 7, y: false, z: myAddress() };
    }
}