struct LargeNested {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Int?;
    x5: String?;
    x6: Bool?;
    x7: Int;
    x8: Bool;
    x9: String;
}

contract ManyNestedFields {
    field1: LargeNested;
    field2: LargeNested;

    init() {
        self.field1 = LargeNested{ x1:1, x2:true, x3:"a", x4:null, x5:"", x6:false, x7:2, x8:false, x9:"x"};
        self.field2 = LargeNested{ x1:10, x2:false, x3:"b", x4:15, x5:null, x6:true, x7:22, x8:true, x9:"y"};
    }
}