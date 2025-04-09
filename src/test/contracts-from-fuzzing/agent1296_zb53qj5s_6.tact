struct SerialOrder {
    first: Int as uint8;
    second: Int as uint16;
    third: Int as int64;
    fourth: Int as uint256;
}

contract SerializeOrderTest {
    data: SerialOrder;
    init() {
        self.data = SerialOrder{
            first: 1,
            second: 2,
            third: 3,
            fourth: 4
        };
    }
}