struct MixedOrder {
    intVal: Int;
    optInt: Int?;
    boolVal: Bool;
    strVal: String;
    optBool: Bool?;
    optStr: String?;
}

contract MixedOrderContract {
    data: MixedOrder;

    init() {
        self.data = MixedOrder{
            intVal: 1,
            optInt: null,
            boolVal: false,
            strVal: "hello",
            optBool: true,
            optStr: null
        };
    }
}