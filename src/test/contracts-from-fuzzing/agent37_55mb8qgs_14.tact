struct BigOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: String?;
    e: Bool?;
    f: Bool?;
    g: Address?;
    h: Address?;
    i: Cell?;
    j: Cell?;
}

contract ManyNulls {
    data: BigOptionals;

    init() {
        self.data = BigOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}
