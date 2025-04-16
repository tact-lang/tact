struct WideOptionalNested {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Int?;
}

struct HasNestedOptional {
    optNest: WideOptionalNested;
    num: Int;
}

contract OptionalInStruct {
    state: HasNestedOptional;
    init() {
        self.state = HasNestedOptional{
            optNest: WideOptionalNested{
                a:null,b:"b",c:null,d:4,e:null,f:true,g:null,h:null,i:false,j:99
            },
            num: 222
        };
    }
}