struct MultiOptional {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Bool?;
    e: Int?;
    f: String?;
    g: Cell?;
    h: Bool?;
}

contract ComplexOpt {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}
