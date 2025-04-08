struct S1 {
    x: Int;
    y: Bool;
    z: Address;
}

contract Test2 {
    data: S1;

    init() {
        self.data = S1{ x: 10, y: false, z: myAddress() };
    }
    receive() {}
}