struct Wide {
    a: Int; b: Bool; c: String;
    d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String;
    j: Int?; k: Bool?; l: String?;
}

contract VeryWide {
    val: Wide;

    init() {
        self.val = Wide {
            a:1,b:true,c:"c", d:null,e:null,f:null,
            g:2,h:false,i:"i", j:null,k:null,l:null
        };
    }
}