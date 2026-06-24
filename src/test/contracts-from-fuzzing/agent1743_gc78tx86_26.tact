struct NestedStruct {
    i: Int;
    b: Bool;
    s: String;
}

contract StructDirectFields {
    s1: NestedStruct;
    s2: NestedStruct;
    s3: NestedStruct;

    init() {
        self.s1=NestedStruct{i:1,b:true,s:"a"};
        self.s2=NestedStruct{i:2,b:false,s:"b"};
        self.s3=NestedStruct{i:3,b:true,s:"c"};
    }
}