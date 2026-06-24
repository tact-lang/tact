struct NestedOptionStruct {
    o1: Int?;
    nested: NestedOptionStruct2;
}

struct NestedOptionStruct2 {
    o2: String?;
    o3: Bool?;
}

contract OptNested {
    data: NestedOptionStruct;
    init() {
        self.data = NestedOptionStruct{
            o1: null,
            nested: NestedOptionStruct2{
                o2: null,
                o3: true
            }
        };
    }
}