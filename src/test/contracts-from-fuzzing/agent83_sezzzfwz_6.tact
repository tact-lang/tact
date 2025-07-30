struct InnerLevel2 {
    v1: Int?;
    v2: Bool;
}

struct InnerLevel1 {
    l2: InnerLevel2?;
    x: Int;
}

struct TopStruct {
    level1: InnerLevel1?;
    flag: Bool;
}

contract TestContract {
    storage: TopStruct;

    init() {
        self.storage = TopStruct{
            level1: InnerLevel1{
                l2: null,
                x: 5
            },
            flag: true
        };
    }
}