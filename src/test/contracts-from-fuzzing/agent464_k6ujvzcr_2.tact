struct InnerLevel3 {
    a: Int;
    b: Bool;
}

struct InnerLevel2 {
    x: InnerLevel3;
    y: Int?;
}

struct InnerLevel1 {
    m: InnerLevel2;
    n: Bool;
}

struct OuterStruct {
    p: Int;
    q: InnerLevel1;
}

contract NestedDeep {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            p: 42,
            q: InnerLevel1{
                m: InnerLevel2{
                    x: InnerLevel3{ a: 1, b: false },
                    y: null
                },
                n: true
            }
        };
    }
}