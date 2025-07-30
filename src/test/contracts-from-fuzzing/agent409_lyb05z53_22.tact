struct AlterOrder {
    a: Int as uint8;
    b: Int as int257;
    c: Int;
}

contract AlterOrderContract {
    v: AlterOrder;

    init() {
        self.v = AlterOrder{
            a: 200,
            b: -1234,
            c: 9999,
        };
    }
}