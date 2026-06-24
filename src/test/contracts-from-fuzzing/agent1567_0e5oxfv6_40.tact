struct WideOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Address?;
    f: Address?;
    g: String?;
    h: String?;
}

contract OptionalDiversity {
    val: WideOptional;

    init() {
        self.val = WideOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}