struct LargeStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: Bool?;
    g: Int?;
    h: Bool;
    i: String?;
    j: Int;
    k: Bool;
    l: String;
}

contract LargeFields {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a:1,b:2,c:true,d:false,e:"x",
            f:null,g:null,h:true,i:null,j:10,k:false,l:"y"
        };
    }
}
