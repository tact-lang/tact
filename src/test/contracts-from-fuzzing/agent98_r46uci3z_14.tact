struct OrderStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
}

contract OrderTestContract {
    o: OrderStruct;

    init() {
        self.o = OrderStruct{
            a: 1,
            b: true,
            c: 2,
            d: false,
        };
    }
}