struct BoolThenStruct {
    flag: Bool;
    nestedStruct: Nested;
}

struct Nested {
    num: Int?;
}

contract TestContract {
    bts: BoolThenStruct;

    init() {
        self.bts = BoolThenStruct{
            flag: true,
            nestedStruct: Nested{ num: null }
        };
    }
}