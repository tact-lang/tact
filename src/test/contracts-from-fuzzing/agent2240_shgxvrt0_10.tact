struct SerialOrder {
    intVal: Int as uint8;
    boolVal: Bool;
    strVal: String;
}

contract SerialOrderTest {
    s: SerialOrder;

    init() {
        self.s = SerialOrder{
            intVal: 42,
            boolVal: true,
            strVal: "abc"
        };
    }
}