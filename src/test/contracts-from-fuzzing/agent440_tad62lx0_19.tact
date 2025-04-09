struct ManyTypes {
    a: Int;
    b: Int as int64;
    c: Int as uint8;
    d: Bool;
    e: String;
    f: Bool?;
    g: Int?;
}

contract TestContract {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            a:0,b:1,c:2,d:true,e:"hi",f:null,g:null
        };
    }
}