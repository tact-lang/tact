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

contract MassOptionals {
    optStore: ManyOptionals;

    init() {
        self.optStore = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null,
        };
    }
}