struct AltOrders {
    z: String;
    y: Bool;
    x: Int;
}

contract OrderTest {
    field: AltOrders;

    init() {
        self.field = AltOrders{
            z: "q",
            y: true,
            x: 10,
        };
    }
}
