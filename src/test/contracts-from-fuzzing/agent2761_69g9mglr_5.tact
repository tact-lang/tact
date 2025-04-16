struct LongNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract LongNestedFieldsTest {
    field1: LongNested;
    field2: LongNested;
    field3: LongNested;
    
    init() {
        self.field1 = LongNested{
            a:1,b:true,c:"x",d:null,e:null,f:null,g:2,h:false,i:"y",j:null,k:null,l:null
        };
        self.field2 = LongNested{
            a:3,b:true,c:"p",d:null,e:null,f:null,g:4,h:false,i:"q",j:null,k:null,l:null
        };
        self.field3 = LongNested{
            a:5,b:true,c:"m",d:null,e:null,f:null,g:6,h:false,i:"n",j:null,k:null,l:null
        };
    }
}
