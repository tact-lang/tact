struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: String?;
    l: Int?;
    m: Bool?;
    n: String?;
}

contract ManyFieldsContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a:1,b:2,c:3,d:4,e:5,f:true,g:false,h:true,i:"a",j:"b",k:null,l:null,m:null,n:null
        };
    }
}