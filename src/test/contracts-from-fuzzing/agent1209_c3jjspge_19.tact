struct ParamOrder {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint32;
}

contract SerialOrder {
    data: ParamOrder;

    init() {
        self.data = ParamOrder{
            a:0, b:0, c:0, d:0
        };
    }
}
