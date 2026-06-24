struct SerialOrder {
    id: Int as uint8;
    flag: Bool;
    name: String;
}

contract SerialOrderPersist {
    so: SerialOrder;
    init() {
        self.so = SerialOrder{
            id: 42,
            flag: true,
            name: "Order"
        };
    }
}