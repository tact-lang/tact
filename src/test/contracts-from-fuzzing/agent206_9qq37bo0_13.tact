struct MixedOrder {
    intField: Int;
    optStr: String?;
    boolField: Bool;
    optInt: Int?;
    addrField: Address;
    optBool: Bool?;
    strField: String;
    optAddr: Address?;
}

contract MixedOrderContract {
    data: MixedOrder;

    init() {
        self.data = MixedOrder{
            intField: 1,
            optStr: null,
            boolField: true,
            optInt: 42,
            addrField: myAddress(),
            optBool: null,
            strField: "sample",
            optAddr: null
        };
    }
}
