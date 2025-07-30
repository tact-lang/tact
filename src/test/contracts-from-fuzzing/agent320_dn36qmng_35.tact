struct Many {
    a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool?;
    g: Int; h: Bool; i: String; j: Int?; k: String?; l: Bool?;
}

contract Test {
    m: Many;

    init() {
        self.m = Many{
            a:1, b:true, c:"c", d:null, e:null, f:null,
            g:7, h:false, i:"i", j:10, k:"k", l:true,
        };
    }
}