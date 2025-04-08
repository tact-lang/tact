struct LargeOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: Address?;
}

contract OptionalGiant {
    data: LargeOptional;

    init() {
        self.data = LargeOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null
        };
    }
}