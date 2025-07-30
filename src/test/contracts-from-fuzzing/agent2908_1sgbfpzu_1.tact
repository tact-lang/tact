struct InnerMost {
    x: Int = 1;
    y: Bool = true;
}

struct MidStruct {
    a: Int = 2;
    nested: InnerMost;
    opt_nested: InnerMost?;
}

struct OuterStruct {
    flag: Bool = false;
    big_num: Int = 123;
    mid: MidStruct;
    opt_mid: MidStruct?;
}

contract DeepNestedStorage {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{
            mid: MidStruct{
                nested: InnerMost{x: 7, y: false},
                opt_nested: null,
            },
            opt_mid: null,
        };
    }
}