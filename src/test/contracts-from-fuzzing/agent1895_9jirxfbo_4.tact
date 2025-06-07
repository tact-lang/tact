struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Int;
    g: Bool;
    h: String?;
    i: Bool;
    j: Int;
}

contract ManyFields {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            a:1,b:true,c:null,d:false,e:"hi",f:2,g:false,h:null,i:true,j:3
        };
    }
}