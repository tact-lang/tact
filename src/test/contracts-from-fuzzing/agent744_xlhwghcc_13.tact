struct SerStruct {
    a: Int as uint64;
    b: Int as int32;
    c: Int as uint8;
}

contract TestContract {
    data: SerStruct;

    init() {
        self.data = SerStruct{
            a: 1000,
            b: -55,
            c: 200
        };
    }
}