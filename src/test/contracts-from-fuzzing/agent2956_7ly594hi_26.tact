struct Crazy {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool?;
    i: String?;
    j: Bool;
    k: Int?;
}

contract Wild {
    data: Crazy;

    init() {
        self.data = Crazy{
            a:1,b:null,c:true,d:null,e:"hi",
            f:null,g:99,h:null,i:null,j:false,k:null
        };
    }
}
