struct WeirdOrder {
    a: Int = 1;
    b: Int;
    c: Int = 3;
}

contract WeirdOrderContract {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            b:2
        };
    }
}