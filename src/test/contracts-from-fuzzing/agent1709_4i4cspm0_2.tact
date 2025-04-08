struct InnerLevel {
    b1: Bool;
    b2: Bool;
    text: String;
}

struct OuterLevel {
    intField: Int;
    nested: InnerLevel;
    s: String;
}

contract DoubleNestedStruct {
    nestedStruct: OuterLevel;

    init() {
        self.nestedStruct = OuterLevel{
            intField: 17,
            nested: InnerLevel{b1:true,b2:false,text:"deep"},
            s: "end"
        };
    }
}