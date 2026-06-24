struct SerialStruct {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
}

contract TestContract {
    data: SerialStruct;
    init() {
        self.data = SerialStruct{
            a: 255,
            b: 123456789,
            c: -789654123
        };
    }
}