struct SerialStruct {
    a: Int as uint8;
    b: Int as int16;
    c: String;
}

contract FieldSerialization {
    data: SerialStruct;

    init() {
        self.data = SerialStruct{
            a: 5,
            b: -12,
            c: "ser"
        };
    }
}