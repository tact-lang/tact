struct MultiOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Address?;
    f: Address?;
    g: String?;
    h: String?;
    i: Cell?;
    j: Cell?;
}

contract ManyNulls {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a:null,b:null,c:null,d:null,
            e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}