struct SerStruct {
    x: Int as int64;
    y: Int as uint4;
    s: String?;
}

contract Test {
    data: SerStruct;

    init() {
        self.data = SerStruct {
            x: -42,
            y: 7,
            s: null,
        };
    }
}