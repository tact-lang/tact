struct InnerNested {
    innerOptInt: Int?;
    innerStr: String;
}

struct OuterNested {
    optInner: InnerNested?;
    outerInt: Int;
    outerBool: Bool;
}

contract NestedStructStorage {
    myData: OuterNested;
    
    init() {
        self.myData = OuterNested{
            optInner: null,
            outerInt: 1,
            outerBool: false,
        };
    }
}