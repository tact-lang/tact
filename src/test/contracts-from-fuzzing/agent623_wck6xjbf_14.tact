struct BigStruct {
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

contract StructFields {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            a:1,b:true,c:"x",d:null,e:true,f:null,g:2,h:false,i:"y",j:null,k:false,l:null,
        };
    }
}