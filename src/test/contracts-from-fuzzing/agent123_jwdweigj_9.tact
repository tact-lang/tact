struct Wide {
    a: Int; b: Bool; c: Int?; d: String; e: Bool?;
    f: String; g: Int; h: Bool; i: Int?; j: String;
    k: Bool?; l: String; m: Int; n: Bool; o: String?;
}

contract WideStructStorage {
    field: Wide;

    init() {
        self.field = Wide{
            a:1, b:true, c:null, d:"a", e:false, f:"b", g:2, h:false,
            i:null, j:"c", k:true, l:"d", m:3, n:true, o:null
        };
    }
}