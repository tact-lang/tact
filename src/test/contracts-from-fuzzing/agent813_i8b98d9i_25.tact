struct ManyOptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract ManyOptionalsStructField {
    data: ManyOptionStruct;

    init() {
        self.data = ManyOptionStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}