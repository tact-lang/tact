struct SerialStruct {
    a: Int as int64;
    b: Int as uint128;
    c: Int as int8;
    d: Int as uint1;
    e: Bool;
    f: Bool?;
}

contract SerializedStructStorage {
    data: SerialStruct;

    init() {
        self.data = SerialStruct{
            a: -1,
            b: 0,
            c: 1,
            d: 1,
            e: false,
            f: null
        };
    }

    receive() {
        self.data.c = self.data.c + 1;
    }
}