struct Many {
    a: Int; b: Bool; c: String; d: Int?; e: String?; f: Bool?;
    g: Int; h: Bool; i: String; j: Int?; k: String?; l: Bool?;
}

contract BigComb {
    val: Many;

    init() {
        self.val = Many{
            a:1, b:true, c:"c", d:null, e:null, f:null, g:2, h:false, i:"i", j:null, k:null, l:null
        };
    }
}