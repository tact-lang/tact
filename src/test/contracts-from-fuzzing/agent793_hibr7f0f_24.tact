struct Numerous {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
}

contract WideStruct {
    s: Numerous;
    init() {
        self.s = Numerous{
            a:1,b:true,c:"x",d:null,e:null,f:null,
            g:2,h:false,i:"y",j:null,k:null,l:null
        };
    }
}