struct OptSerial {
    a: Int? as uint8;
}

contract TestOptSerialize {
    val: OptSerial;

    init() {
        self.val = OptSerial{
            a: null
        };
    }
}