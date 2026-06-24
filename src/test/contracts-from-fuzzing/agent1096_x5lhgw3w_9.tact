struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: Bool?;
    k: String;
    l: String?;
}

contract BigStructStorage {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a:1,b:null,c:true,d:false,e:"a",f:null,g:2,h:null,i:false,j:null,k:"b",l:null
        };
    }
}