struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: String?;
    h: Address?;
    i: Slice?;
    j: Cell?;
}

contract TestContract {
    optVals: ManyOptionals;

    init() {
        self.optVals = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}