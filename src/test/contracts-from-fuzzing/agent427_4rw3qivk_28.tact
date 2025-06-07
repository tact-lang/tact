struct SerialWithAddress {
    addr: Address;
    intVal: Int as uint32;
    boolVal: Bool;
}

contract MixedSerializations {
    val: SerialWithAddress;

    init() {
        self.val = SerialWithAddress{
            addr: myAddress(),
            intVal: 42,
            boolVal: true
        };
    }
}