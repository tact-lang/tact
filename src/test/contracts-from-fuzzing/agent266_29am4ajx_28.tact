struct FlexibleOrder {
    x: Int;
    y: Int;
    z: Int;
}

contract InitOrderContract {
    data: FlexibleOrder;

    init() {
        self.data = FlexibleOrder{
            z:3,
            x:1,
            y:2
        };
    }
}