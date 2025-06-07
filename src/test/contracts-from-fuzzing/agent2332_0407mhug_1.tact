struct BigNested {
    id: Int;
    payload: PayloadStruct;
}

struct PayloadStruct {
    nested1: NestedLevel1;
    flag: Bool;
}

struct NestedLevel1 {
    text: String;
    amount: Int;
    inner: InnerMost;
}

struct InnerMost {
    status: Bool;
    number: Int;
    info: String;
}

contract DeepContract {
    data: BigNested;
    
    init() {
        self.data = BigNested{
            id: 1,
            payload: PayloadStruct{
                nested1: NestedLevel1{
                    text: "abc",
                    amount: 42,
                    inner: InnerMost{
                        status: true,
                        number: 100,
                        info: "test"
                    }
                },
                flag: false
            }
        };
    }
}