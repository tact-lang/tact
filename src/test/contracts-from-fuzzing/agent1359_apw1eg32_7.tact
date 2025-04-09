struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: Slice?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract ManyOptionalsContract {
    storage: ManyOptionals;

    init() {
        self.storage = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}