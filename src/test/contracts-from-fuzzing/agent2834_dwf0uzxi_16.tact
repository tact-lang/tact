struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract OptMultiFields {
    vals: MultiOptional;

    init() {
        self.vals = MultiOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null
        };
    }
}