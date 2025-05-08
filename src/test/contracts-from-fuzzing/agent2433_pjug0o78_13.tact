struct LargeNestedStruct {
    a: Inner;
    b: Inner;
    c: Inner;
}

struct Inner {
    v1: Int;
    v2: Bool;
    v3: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract LargeNestedTest {
    data: LargeNestedStruct;

    init() {
        self.data = LargeNestedStruct{
            a: Inner{v1:1,v2:true,v3:"a",o1:null,o2:null,o3:null},
            b: Inner{v1:2,v2:false,v3:"b",o1:null,o2:null,o3:null},
            c: Inner{v1:3,v2:true,v3:"c",o1:null,o2:null,o3:null}
        };
    }
}