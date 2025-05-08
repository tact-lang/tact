struct SerialOrder {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
}

contract SerialOrderContract {
    data: SerialOrder;

    init() {
        self.data = SerialOrder{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}
