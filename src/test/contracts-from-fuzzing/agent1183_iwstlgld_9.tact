struct SerialStruct {
    a: Int as int8;
    b: Int as uint16;
    c: Bool;
}

contract SerialStructContract {
    s: SerialStruct;

    init() {
        self.s = SerialStruct{
            a: -5,
            b: 12345,
            c: true,
        };
    }
}