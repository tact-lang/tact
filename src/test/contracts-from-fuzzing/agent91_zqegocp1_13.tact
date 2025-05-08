struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int?;
    j: Bool?;
}

contract Test {
    field: DeepOptionals;

    init() {
        self.field = DeepOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}