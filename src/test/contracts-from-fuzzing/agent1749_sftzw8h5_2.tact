struct InnerStruct {
    val1: Bool;
    val2: Int?;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
    count: Int;
}

contract TestNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: InnerStruct{
                val1: true,
                val2: null,
            },
            flag: false,
            count: 0,
        };
    }
}