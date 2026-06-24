struct SmallStruct {
    a: Int as int8;
    b: Int as uint8;
    c: Bool;
    d: Bool?;
}
contract SmallTypesExample {
    data: SmallStruct;

    init() {
        self.data = SmallStruct{
            a: -5,
            b: 255,
            c: true,
            d: false,
        };
    }
}