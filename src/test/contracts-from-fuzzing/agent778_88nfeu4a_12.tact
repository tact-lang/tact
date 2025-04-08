struct BigNestedFields {
    i0: Int;
    inner: InnerStruct;
    endFlag: Bool;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract TestNestedStruct {
    data: BigNestedFields = BigNestedFields{
        i0: 1,
        inner: InnerStruct{a:2,b:true,c:null,d:null},
        endFlag:false
    };

    init() {
        self.data = BigNestedFields{
            i0:1,
            inner: InnerStruct{a:2,b:true,c:null,d:null},
            endFlag:false
        };
    }
}