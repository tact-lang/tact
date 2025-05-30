struct SerialOrder {
    a: Int as uint4;
    b: Int as int8;
    c: Bool;
    d: Int as uint16;
}

contract TestContract {
    dat: SerialOrder;
    init() {
        self.dat = SerialOrder{ a:5, b:-3, c:true, d:1234 };
    }
}