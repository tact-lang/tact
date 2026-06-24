struct InnerStruct {
    enabled: Bool;
    note: String;
}

struct MiddleStruct {
    info: InnerStruct;
    score: Int;
    amount: Int;
}

contract NestedStructStorage {
    data1: MiddleStruct;
    data2: MiddleStruct;

    init() {
        self.data1 = MiddleStruct{
            info: InnerStruct{enabled: true, note: "A"},
            score: 10,
            amount: 100
        };
        self.data2 = MiddleStruct{
            info: InnerStruct{enabled: false, note: "B"},
            score: 20,
            amount: 200
        };
    }
}