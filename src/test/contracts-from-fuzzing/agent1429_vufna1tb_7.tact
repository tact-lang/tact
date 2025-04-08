struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int?;
}

contract BigOptional {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null,b:true,c:null,d:null,e:false,f:null,g:7,h:null,i:"hi",j:42
        };
    }
}
