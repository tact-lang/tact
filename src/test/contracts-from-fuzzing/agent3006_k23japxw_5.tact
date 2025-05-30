struct IntAndBool {
    a: Int;
    b: Bool;
}

struct AnotherStruct {
    c: String;
    nested: IntAndBool;
    d: Bool?;
    e: Int; 
}

contract MultiStructFields {
    field1: Int;
    structField: IntAndBool;
    structField2: AnotherStruct;
    flag: Bool;

    init() {
        self.field1 = 7;
        self.structField = IntAndBool{a:1,b:true};
        self.structField2 = AnotherStruct{
            c: "hi",
            nested: IntAndBool{a:2,b:false},
            d: null,
            e: 9,
        };
        self.flag = false;
    }
}
