struct DataStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
}

contract AllMixed {
    val: DataStruct;

    init() {
        self.val = DataStruct{
            a: 123,
            b: null,
            c: true,
            d: null
        };
    }
}