struct SerStruct {
    a: Int as uint8;
    b: Int as int32;
    c: Bool;
    d: Int?;
}

contract SerFields {
    data: SerStruct;

    init() {
        self.data = SerStruct{
            a: 200,
            b: -50,
            c: true,
            d: 1234
        };
    }
}