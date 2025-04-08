struct OrderTest {
    first: Int as uint4;
    second: Int as uint8;
    third: Int as int16;
    fourth: Int as uint32;
}

contract SerializationOrder {
    s: OrderTest;

    init() {
        self.s = OrderTest{first:5, second:8, third:-255, fourth:100000};
    }
}