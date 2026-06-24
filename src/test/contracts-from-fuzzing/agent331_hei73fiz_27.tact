struct WeirdOrder {
    f3: Int;
    f1: Bool;
    f2: String;
}

contract OutOfOrderStruct {
    weird: WeirdOrder;

    init() {
        self.weird = WeirdOrder{
            f3:3, f1:true, f2:"x"
        };
    }
}