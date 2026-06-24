struct OutOfOrder {
    first: Int;
    second: Int;
}

contract InitOutOfOrder {
    data: OutOfOrder;

    init() {
        self.data = OutOfOrder{
            second: 2,
            first: 1,
        };
    }
}