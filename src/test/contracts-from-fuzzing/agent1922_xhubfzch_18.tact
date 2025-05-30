struct OptionalMany {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
}

contract ManyNulls {
    vals: OptionalMany;

    init() {
        self.vals = OptionalMany{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null
        };
    }
}