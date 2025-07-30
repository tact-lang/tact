struct SerializedStruct {
    a: Int as int32;
    b: Int as uint64;
    c: Int? as int1;
    d: Int? as uint8;
    e: Bool;
    f: Bool?;
    g: String;
}

contract TestContract {
    data: SerializedStruct;

    init() {
        self.data = SerializedStruct{
            a: -123,
            b: 123456,
            c: null,
            d: 255,
            e: true,
            f: false,
            g: "hello",
        };
    }
}
