struct Nested {
    innerVal: Int;
    innerBool: Bool;
}

struct Middle {
    nestedStruct: Nested;
    middleVal: Int;
}

contract DeeplyNested {
    data: Middle;
    
    init() {
        self.data = Middle{
            nestedStruct: Nested{
                innerVal: 10,
                innerBool: false,
            },
            middleVal: 42,
        };
    }
}