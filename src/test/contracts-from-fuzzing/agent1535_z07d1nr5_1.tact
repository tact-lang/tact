struct InnerNested {
    flag: Bool;
    count: Int;
}

struct OuterNested {
    nested: InnerNested;
    data: String;
    optNum: Int?;
}

contract DeepNestTest {
    param1: Int = 0;
    param2: Bool = false;
    nestedData: OuterNested = OuterNested{
        nested: InnerNested{ flag: true, count: 5 },
        data: "test",
        optNum: null,
    };

    init() {
        self.param1 = 10;
        self.param2 = true;
    }
}
