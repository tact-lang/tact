struct NestedDeep {
    level1: Int;
    level2: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    data: DeeperStruct;
}

struct DeeperStruct {
    amount: Int?;
    description: String;
}

contract TestContract {
    storage: NestedDeep;
    
    init() {
        self.storage = NestedDeep {
            level1: 1,
            level2: InnerStruct {
                flag: true,
                data: DeeperStruct {
                    amount: null,
                    description: "test"
                }
            }
        };
    }
}
