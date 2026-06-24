struct Wide {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: Int?;
    l: Bool?;
    m: String?;
}

contract WideFields {
    wide: Wide;

    init() {
        self.wide = Wide{
            a:1,b:2,c:3,d:4,e:5,f:true,g:false,h:true,i:"x",j:"y",k:null,l:null,m:null
        };
    }
}
