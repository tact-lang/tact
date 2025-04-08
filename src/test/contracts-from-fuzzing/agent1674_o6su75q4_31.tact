struct Data {
    a: Int as uint8;
    b: Int as uint16;
    flag: Bool?;
    note: String?;
}

contract SerializationOptionals {
    info: Data;

    init() {
        self.info = Data{
            a: 10,
            b: 1000,
            flag: null,
            note: null,
        };
    }
}