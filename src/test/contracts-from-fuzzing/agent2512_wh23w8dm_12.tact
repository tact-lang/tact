struct StrangeOrder {
    second: Int;
    first: Int;
    third: Int;
}

contract FieldOrderTest {
    data: StrangeOrder;

    init() {
        self.data = StrangeOrder{
            second: 2,
            first: 1,
            third: 3
        };
    }
}