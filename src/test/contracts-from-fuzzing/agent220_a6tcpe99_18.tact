struct SerStruct {
    foo: Int as uint8;
    bar: Int as int16;
    baz: Int;
}

contract StructSerial {
    data: SerStruct;

    init() {
        self.data = SerStruct{
            foo: 200,
            bar: -1000,
            baz: 123456789
        };
    }

    receive() {}
}