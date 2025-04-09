struct OrderTest {
    x: Int as uint32;
    y: Int;
    z: Bool;
}

contract Test23 {
    s: OrderTest;

    init() {
        self.s = OrderTest{ x: 100, y: -1, z: true };
    }
}