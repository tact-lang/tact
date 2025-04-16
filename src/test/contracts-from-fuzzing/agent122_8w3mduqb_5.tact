struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool?;
    f: Int;
    g: Bool;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool?;
}

contract ManyFields {
    data: BigStruct = BigStruct{
        a:0,b:1,c:true,d:2,e:null,f:3,g:false,h:null,i:4,j:true,k:5,l:false
    };
    init() {
        self.data = BigStruct{
            a:10,b:11,c:false,d:12,e:true,f:13,g:true,h:false,i:14,j:false,k:15,l:true
        };
    }
}
