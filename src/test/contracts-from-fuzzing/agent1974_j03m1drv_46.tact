struct UnusualOrder {
    z: Int?;
    y: Bool;
    x: Int;
}

contract OrderTest {
    data: UnusualOrder;

    init() {
        self.data = UnusualOrder{
            z: null,
            y: true,
            x: 42
        };
    }
}
