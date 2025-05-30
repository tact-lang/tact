struct WithSerializedFields {
    i8: Int as int8;
    u16: Int as uint16;
    boolval: Bool;
}

contract SerialContract {
    data: WithSerializedFields = WithSerializedFields{
        i8: 10,
        u16: 20,
        boolval: true
    };

    receive() {
        self.data = self.data;
    }
}