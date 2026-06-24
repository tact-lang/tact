struct TupleStruct {
    _1: Int;
    _2: Bool;
    _3: String;
    _4: Int?;
    _5: Bool?;
}

contract TupleStorage {
    data: TupleStruct;

    init() {
        self.data = TupleStruct{
            _1: 42,
            _2: false,
            _3: "hi",
            _4: 99,
            _5: null
        };
    }
}