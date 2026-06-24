struct StrangeOrder {
    first: Int as uint8;
    second: Bool;
    third: Int;
    fourth: Int as int64;
    fifth: Bool;
    sixth: Int?;
}

contract Test9 {
    data: StrangeOrder;

    init() {
        self.data = StrangeOrder{
            first: 1,
            second: false,
            third: 123456,
            fourth: -64,
            fifth: true,
            sixth: null
        };
    }
}