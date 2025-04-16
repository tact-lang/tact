struct OptionalSerial {
    val: Int? as uint16;
}

contract OptionalSerialContract {
    foo: OptionalSerial;

    init() {
        self.foo = OptionalSerial{val: null};
    }

    receive() {}
}