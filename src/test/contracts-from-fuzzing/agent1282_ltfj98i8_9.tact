struct BigStruct {
    a: Int; b: Bool; c: String;
    d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String;
    j: Int?; k: Bool?; l: String?;
    m: Int; n: Bool; o: String;
    p: Int?; q: Bool?; r: String?;
}

contract BigFields {
    f1: BigStruct;
    f2: BigStruct;

    init() {
        self.f1 = BigStruct{
            a:1,b:true,c:"x",d:null,e:null,f:null,
            g:2,h:false,i:"y",j:null,k:null,l:null,
            m:3,n:true,o:"z",p:null,q:null,r:null
        };
        self.f2 = self.f1;
    }
}